// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';

class AICoachCard extends StatelessWidget {
  final String image;
  final String name;
  final String title;
  final String route;

  const AICoachCard({
    Key? key,
    required this.image,
    required this.name,
    required this.title,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
            title: Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade600,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.aiCoachChatScreen,
                arguments: {
                  'coachName': name,
                  'coachImage': image,
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
