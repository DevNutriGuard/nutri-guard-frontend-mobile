import 'package:flutter/material.dart';

class DailyMealCradsWidgets extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String typeName;
  final String description;

  const DailyMealCradsWidgets({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.typeName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    imageUrl,
                    width: 60.0,
                    height: 60.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      const SizedBox(height: 3),
                      Text(typeName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      const SizedBox(height: 3),
                      Text(description,
                          style: const TextStyle(
                            fontSize: 12,
                          ))
                    ],
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Icon(Icons.arrow_forward_ios, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
