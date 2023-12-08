
import 'package:chatbot_feridas/models/ChatMessage.dart';
import 'package:chatbot_feridas/screens/message_screen/chatbot_screen.dart';
import 'package:flutter/material.dart';

class MyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<List<ChatMessage>>(
        future: fetchChatMessages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Exibir um indicador de carregamento enquanto os dados são buscados
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            var demeChatMessages = snapshot.data ?? [];
            return ChatbotScreen();
          }
        },
      ),
    );
  }
}
