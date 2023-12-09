import 'package:chatbot_feridas/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatInputField extends StatelessWidget {
  final Function(String) sendMessageTo;
  


  const ChatInputField({Key? key, required this.sendMessageTo}) : super(key: key);

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
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 10,
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: "Escreva sua mensagem",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
               IconButton(
        icon: Icon(Icons.send, color: Colors.blue, size: 40.0),
        onPressed: () {
          sendMessageTo(messageController.text); // Chama a função passada por parâmetro
          messageController.clear();
        },
      )
          ],
        ),
      ),
    );
  }
}
