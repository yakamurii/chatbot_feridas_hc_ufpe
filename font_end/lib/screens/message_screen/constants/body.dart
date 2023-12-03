import 'package:chatbot_feridas/models/ChatMessage.dart';
import 'package:chatbot_feridas/screens/message_screen/constants/chat_input_field.dart';
import 'package:chatbot_feridas/utils/global_colors.dart';
import 'package:flutter/material.dart';



class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index)=>Message(message: demeChatMessages[index],),
              ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    super.key, required this.message,
  });

  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if(!message.isSender)...[ 
          CircleAvatar(radius: 30, backgroundImage: AssetImage("assets/images/assistente-de-robo.png"),),
        ],
        TextMessage(message: message,),

      ],
    );
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({
    super.key, required this.message,
  });
  final ChatMessage message;
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
          color: GlobalColors.mainColor.withOpacity(message.isSender ? 1 : 0.5), 
          borderRadius: BorderRadius.circular(20),
          ),
      child: Text(message.text, 
      style: TextStyle(color: message.isSender ? GlobalColors.textWhiteColor : GlobalColors.textBlackColor,
      fontSize: 17
      ),
      )
      );
  }
}

