// ignore_for_file: use_super_parameters, prefer_const_constructors, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nutri_guard_mobile/profile/presentation/ai-coach/ai_chat_history_screen.dart';

class AiCoachChatScreen extends StatefulWidget {
  final String coachName;
  final String coachImage;

  const AiCoachChatScreen(
      {Key? key, required this.coachName, required this.coachImage})
      : super(key: key);

  @override
  _AiCoachChatScreenState createState() => _AiCoachChatScreenState();
}

class _AiCoachChatScreenState extends State<AiCoachChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> messages = [];

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      final currentTime = DateFormat('hh:mm a').format(DateTime.now());
      setState(() {
        messages.add({'type': 'user', 'message': message, 'time': currentTime});
        messages.add({
          'type': 'coach',
          'message': 'This is a response.',
          'time': currentTime
        });
      });
      _messageController.clear();
    }
  }

  void _goToChatHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatHistoryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          widget.coachName,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.chat, color: Colors.black),
            onPressed: _goToChatHistory,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message['type'] == 'user';

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color:
                          isUser ? Colors.grey.shade100 : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isUser)
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(widget.coachImage),
                          ),
                        if (!isUser) SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: isUser
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                isUser ? "You" : widget.coachName,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: isUser
                                      ? Colors.black
                                      : Colors.grey.shade700,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                message['message']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isUser
                                      ? Colors.black
                                      : Colors.grey.shade800,
                                ),
                              ),
                              SizedBox(height: 4),
                              Align(
                                alignment: isUser
                                    ? Alignment.bottomLeft
                                    : Alignment.bottomRight,
                                child: Text(
                                  message['time']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isUser) SizedBox(width: 8),
                        if (isUser)
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/user.png'),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(0, -1),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
