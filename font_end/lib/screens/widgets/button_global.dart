import 'package:chatbot_feridas/utils/global_colors.dart';
import 'package:flutter/material.dart';

class ButtonGlobal extends StatelessWidget {
  const ButtonGlobal({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // ignore: avoid_print
        print('Login');
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: GlobalColors.buttonColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: GlobalColors.textWhiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}