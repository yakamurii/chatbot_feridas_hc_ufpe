import 'package:chatbot_feridas/screens/login_screen.dart';
import 'package:chatbot_feridas/screens/message_screen/constants/body.dart';
import 'package:chatbot_feridas/utils/global_colors.dart';
import 'package:flutter/material.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newMethod(),
      body: Body(),
    );
     
   }

  AppBar newMethod() {
    return AppBar(
      backgroundColor: GlobalColors.mainColor,
      automaticallyImplyLeading: false,
      title: const Row(
        children: [
          // CircleAvatar(
          //   backgroundImage: AssetImage("assets/images/user_2.png"),
          //   ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text("Chatbot HC", 
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
            ),
          ],
          )
        ],  
      ),

      
    );
  }
}