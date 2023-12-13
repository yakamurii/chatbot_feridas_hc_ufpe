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
  List<ChatMessage> messages = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Chama o método fetchData para obter a primeira mensagem
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(widget.apiUrl));
      final decodedResponse = jsonDecode(response.body);

      if (decodedResponse is Map &&
          decodedResponse.containsKey('isSender') &&
          decodedResponse.containsKey('mensagem')) {
        final chatMessage = ChatMessage(
          message: decodedResponse['mensagem'],
          isSender: decodedResponse['isSender'],
        );
        setState(() {
          messages.add(chatMessage);
        });
      }
    } catch (e) {
      print('Erro ao carregar a mensagem: $e');
      // Lidere com o erro de acordo com a lógica do seu aplicativo
    }
  }


  void sendMessage(String message) async {
    final apiUrl = 'http://10.0.2.2:5000/chat';
    final body = {'isSender': 'true', 'mensagem': message};

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final mensagem = decodedResponse["mensagem"];
      final status = decodedResponse["isSender"];

      final chatMessage = ChatMessage(message: mensagem, isSender: status);

      setState(() {
        messages.insert(0, chatMessage);
      });

      if (status == "Fim da conversa") {

      }
    } else {
      print('Erro ao enviar mensagem - ${response.statusCode}');

    }
  }

 @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final chatMessage = messages[index];

              return Row(
                mainAxisAlignment: chatMessage.isSender
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  if (!chatMessage.isSender)
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage("assets/images/assistente-de-robo.png"),
                    ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.blue
                          .withOpacity(chatMessage.isSender ? 1 : 0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      chatMessage.message,
                      style: TextStyle(
                        color:
                            chatMessage.isSender ? Colors.white : Colors.black,
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
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      )
      );
  }
}

