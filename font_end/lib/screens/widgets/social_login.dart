import 'package:chatbot_feridas/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Container(
          alignment: Alignment.center,
           child: Text(
            '-- Ou acesse com --',
            style: TextStyle(
              color: GlobalColors.textBlackColor,
              fontWeight: FontWeight.w600,
            ),
                 ),
         ),
         const SizedBox(height: 15,),
         // ignore: sized_box_for_whitespace
         Container(
          width: MediaQuery.of(context).size.width * 0.6,
           child: Row(
            children: [
              //Google
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: SvgPicture.asset('assets/icons/google.svg', height: 60,),
                ),
              ),
              const SizedBox(width: 10,),
              //Facebook
               Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: SvgPicture.asset('assets/icons/facebook.svg', height: 60,),
                ),
               ),
            ],
           ),
         )
      ],
    );
  }
}