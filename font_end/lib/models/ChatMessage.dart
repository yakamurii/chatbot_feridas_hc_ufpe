// import 'package:chatbot_feridas/http/cliente_http.dart';
// import 'package:flutter/material.dart';


// enum ChatMessageType { text }
// enum MessageStatus { not_sent, not_view, viewed }

// class ChatMessage {
//   final String text;
//   final ChatMessageType messageType;
//   final MessageStatus messageStatus;
//   final bool isSender;

//   ChatMessage({
//     required this.text,
//     required this.messageType,
//     required this.messageStatus,
//     required this.isSender,
//   });
// }

// Future<List<ChatMessage>> fetchChatMessages() async {
//   final clienteHttp = ClienteHttp(); 
//   final url = 'http://127.0.0.1:5000/chat'; 

//   try {
//     final response = await clienteHttp.get(url: url);
//     if (response.statusCode == 200) {
//       final List<dynamic> data = response.body;
//       final List<ChatMessage> chatMessages = data.map((item) {
//         return ChatMessage(
//           text: item['pergunta'],
//           messageType: ChatMessageType.text,
//           messageStatus: MessageStatus.viewed,
//           isSender: item['isImportant'] ?? false,
//         );
//       }).toList();

//       return chatMessages;
//     } else {
//       throw Exception('Failed to load chat messages');
//     }
//   } catch (e) {
//     throw Exception('Failed to fetch chat messages: $e');
//   }
// }
