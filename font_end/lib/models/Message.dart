import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Message {
  final String pergunta;
  final bool isImportant;

  Message({required this.pergunta, required this.isImportant});

  factory Message.fromMap(Map<String, dynamic> map){
    return Message(
      pergunta: map['pergunta'], 
      isImportant: map['isImportant']
      );
  }
  
}


