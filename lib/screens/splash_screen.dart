import 'package:chatbot_feridas/utils/global_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body:  Center(
        child: Text(
          'Logo', 
          style: TextStyle(
            color: GlobalColors.textWhiteColor,
            fontSize: 30,
            fontWeight: FontWeight.bold),
            
          ),
      ),
    );
  }

}