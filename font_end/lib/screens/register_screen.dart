import 'package:chatbot_feridas/screens/login_screen.dart';
import 'package:chatbot_feridas/screens/widgets/button_global.dart';
import 'package:chatbot_feridas/screens/widgets/social_login.dart';
import 'package:chatbot_feridas/screens/widgets/text_form_global.dart';
import 'package:chatbot_feridas/utils/global_colors.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController medicalRecordController = TextEditingController();
  
  
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
                const SizedBox(height: 50,),
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
                const SizedBox(height: 15,), 
                //Name Input
                 TextFormGlobal(
                  controller: nameController,
                  text: 'Nome', 
                  obscure: false, 
                  textInputType: TextInputType.name,
                  ),  
                  const SizedBox(height: 10,),
                   //CPF Input
                 TextFormGlobal(
                  controller: cpfController,
                  text: 'CPF', 
                  obscure: false, 
                  textInputType: TextInputType.number,
                  ),  
                  const SizedBox(height: 10,),
                   //Medical Record Input
                 TextFormGlobal(
                  controller: medicalRecordController,
                  text: 'Nº Prontuário', 
                  obscure: false, 
                  textInputType: TextInputType.number,
                  ),  
                  const SizedBox(height: 10,),
                /// Email Input
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email', 
                  obscure: false, 
                  textInputType: TextInputType.emailAddress,
                  ),  
                  const SizedBox(height: 10,),
                  //Password Input
                  TextFormGlobal(
                    controller: passwordController, 
                    text: 'Senha', 
                    textInputType: TextInputType.text, 
                    obscure: true
                    ),
                  const SizedBox(height:10 ,),
                  //Confirm Password Input
                  TextFormGlobal(
                    controller: passwordController, 
                    text: 'Confirmar senha ', 
                    textInputType: TextInputType.text, 
                    obscure: true
                    ),
                  const SizedBox(height:10 ,),
                  const ButtonGlobal(text: 'Cadastrar',),
                  const SizedBox(height:25 ,),
                  const SocialLogin(),
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
              'Já está cadastrado?'
              ),
            InkWell(
               onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
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