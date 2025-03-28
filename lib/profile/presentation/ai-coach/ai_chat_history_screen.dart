// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'ai_coach_chat_screen.dart';

class ChatHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatHistory = [
      {'coachName': 'Coach 1', 'description': 'First chat with Coach 1'},
      {'coachName': 'Coach 2', 'description': 'Chat about fitness goals'},
      {'coachName': 'Coach 3', 'description': 'Health check-in and advice'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat History'),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: chatHistory.length,
        itemBuilder: (context, index) {
          final chat = chatHistory[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              title: Text(chat['coachName']!),
              subtitle: Text(chat['description']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AiCoachChatScreen(
                      coachName: chat['coachName']!,
                      coachImage: 'assets/images/coach.png',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
