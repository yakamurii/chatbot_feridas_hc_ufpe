import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chatbot_feridas/http/cliente_http.dart';
import 'package:chatbot_feridas/models/ChatMessage.dart';
import 'package:chatbot_feridas/screens/message_screen/constants/chat_input_field.dart';
import 'package:chatbot_feridas/utils/global_colors.dart';
import 'package:flutter/material.dart';



class Body extends StatelessWidget {
  final String apiUrl = "http://10.0.2.2:5000/chat";

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<String> fetchData() async {
      final response = await http.get(Uri.parse(apiUrl));
      final decodedResponse = jsonDecode(response.body);
      final firstObject = decodedResponse[0];

      if (decodedResponse is List && decodedResponse.isNotEmpty) {
        final firstObject = decodedResponse[0];
        if (firstObject.containsKey('isImportant') && firstObject.containsKey('pergunta')) {
          // Monta a string no formato desejado manualmente
          final jsonString = '{"isImportant": ${firstObject['isImportant']}, "pergunta": "${firstObject['pergunta']}"}';
          return jsonString;
        }
      }
      return '';
    }

    return FutureBuilder<String>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Message(message: snapshot.data ?? ''),
                ),
              ),
              ChatInputField(),
            ],
          );
        }
      },
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final decodedData = jsonDecode(message);

    bool isImportant = decodedData['isImportant'] ?? false;
    String messageText = decodedData['pergunta'] ?? '';

    return Row(
      mainAxisAlignment: isImportant ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (!isImportant)
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/images/assistente-de-robo.png"),
          ),
        TextMessage(message: messageText, isSender: isImportant),
      ],
    );
  }
}


class TextMessage extends StatelessWidget {
  const TextMessage({super.key, required this.message, required this.isSender});
  final bool isSender;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, ),
      padding: 
      EdgeInsets.symmetric(
        horizontal: 20, 
        vertical: 20,
        ),
        decoration: 
        BoxDecoration(
          color: GlobalColors.mainColor.withOpacity(isSender ? 1 : 0.5), 
          borderRadius: BorderRadius.circular(20),
          ),
      child: Text(message, 
      style: TextStyle(color: isSender ? GlobalColors.textWhiteColor : GlobalColors.textBlackColor,
      fontSize: 17
      ),
      )
      );
  }
}