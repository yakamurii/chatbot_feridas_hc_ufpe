import 'package:chatbot_feridas/screens/login_screen.dart';
import 'package:chatbot_feridas/utils/global_colors.dart';
import 'package:flutter/material.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.mainColor,
        title: const Text('Chatbot HC'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             DrawerHeader(
              decoration: BoxDecoration(
                color: GlobalColors.mainColor,
              ),
              child: Text(
                'Olá, Fulano!',
              style: TextStyle(
                color: GlobalColors.textWhiteColor,
                fontSize: 25
                ),
                ),
            ),
            ListTile(
              title: const Text(
                'Dados pessoais', 
                style: TextStyle(fontSize: 20),
                ),
              onTap: () {
                
                Navigator.pop(context); 
              },
            ),
            ListTile(
              title: const Text(
                'Configurações', 
                style: TextStyle(fontSize: 20),
                ),
              onTap: () {  
                Navigator.pop(context); 
              },
            ),
            ListTile(
              title: const Text(
                'Sair', 
                style: TextStyle(fontSize: 15),
                ),
              onTap: () {  
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                ); 
              },
            ),
          ],
        ),
      ),
        body: const Center(
        child: Text('Aqui fica a conversa com o chatbot'),
      ),
    );
  }
}