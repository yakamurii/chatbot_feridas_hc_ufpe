import 'package:chatbot_feridas/screens/register_screen.dart';
import 'package:chatbot_feridas/screens/widgets/button_global.dart';
import 'package:chatbot_feridas/screens/widgets/social_login.dart';
import 'package:chatbot_feridas/screens/widgets/text_form_global.dart';
import 'package:chatbot_feridas/utils/global_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50,),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/hc_ebserh.png'),
                ),
                const SizedBox(height: 80,),
                  Center(
                    child: Text(
                      'Acesse a sua conta',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: GlobalColors.textBlackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ), 
                const SizedBox(height: 25,), 
                /// Email Input
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email', 
                  obscure: false, 
                  textInputType: TextInputType.emailAddress,
                  ),  
                  const SizedBox(height: 25,),
                  //Password Input
                  TextFormGlobal(
                    controller: passwordController, 
                    text: 'Password', 
                    textInputType: TextInputType.text, 
                    obscure: true
                    ),
                  const SizedBox(height:10 ,),
                  const SizedBox(height:35 ,),
                  const ButtonGlobal(text: 'Login',),
                  const SizedBox(height:50 ,),
                  const SocialLogin(),
                  const SizedBox(height:25 ,),
                ],
              ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ainda não se cadastrou?'
              ),
            InkWell(
               onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text(
                'Clique aqui',
                style: TextStyle(
                  color: GlobalColors.mainColor,
                ),
                ),
            )
          ],
          ),
      ),
    );
  }
}