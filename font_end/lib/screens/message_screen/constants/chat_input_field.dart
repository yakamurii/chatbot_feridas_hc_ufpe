import 'package:chatbot_feridas/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChatInputField extends StatelessWidget {
  const ChatInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    
    return Container(
      padding: 
      const EdgeInsets.symmetric(
        horizontal: 10, 
        vertical: 10 
      ),
      decoration: BoxDecoration(
        color:  Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: 
            const Offset(0, 4),
            blurRadius: 10,
            color: GlobalColors.mainColor.withOpacity(0.1)),
           ],
        ),
        child: SafeArea(
          child: Row(
            children: [
             // const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10
                    ),
                  height: 50,
                  decoration: BoxDecoration(
                    color: GlobalColors.buttonColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(6),
                    
                  ),
                  child: const Row(children: [  
                    SizedBox(width: 10,),
                    Expanded(child:
                     TextField(
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
              Icon(Icons.send, color: GlobalColors.mainColor, size: 40.0,),
            ],
          ),
          ),
    );
  }
  
  void setState(Null Function() param0) {}
}