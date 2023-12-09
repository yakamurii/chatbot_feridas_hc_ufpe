import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chatbot_feridas/http/cliente_http.dart';
import 'package:chatbot_feridas/models/ChatMessage.dart';
import 'package:chatbot_feridas/screens/message_screen/constants/chat_input_field.dart';
import 'package:chatbot_feridas/utils/global_colors.dart';
import 'package:flutter/material.dart';




class Body extends StatefulWidget {
  final String apiUrl = "http://10.0.2.2:5000/chat";

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  List<String> messages = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(widget.apiUrl));
    final decodedResponse = jsonDecode(response.body);

    if (decodedResponse is List && decodedResponse.isNotEmpty) {
      final firstObject = decodedResponse[0];
      if (firstObject.containsKey('isImportant') && firstObject.containsKey('pergunta')) {
        final jsonString =
            '{"isImportant": ${firstObject['isImportant']}, "pergunta": "${firstObject['pergunta']}"}';
        
        // Verifica se a mensagem já existe na lista
        if (!messages.contains(jsonString)) {
          setState(() {
            messages.insert(0, jsonString);
          });
        }
      }
    }
  }

  void sendMessage(String message) async {
    final apiUrl = 'http://10.0.2.2:5000/chat';
    final body = {'isImportant': 'true', 'pergunta': message};

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 201) {
      print('Mensagem enviada com sucesso!');
    } else {
      print('Erro ao enviar mensagem - ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataPeriodically();
  }

  void fetchDataPeriodically() {
    Timer.periodic(Duration(seconds: 10), (timer) {
      fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final decodedData = jsonDecode(messages[index]);
              bool isImportant = decodedData['isImportant'] ?? false;
              String messageText = decodedData['pergunta'] ?? '';

              return Row(
                mainAxisAlignment: isImportant ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  if (!isImportant)
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/assistente-de-robo.png"),
                    ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(isImportant ? 1 : 0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      messageText,
                      style: TextStyle(
                        color: isImportant ? Colors.white : Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        ChatInputField(sendMessageTo: sendMessage),
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