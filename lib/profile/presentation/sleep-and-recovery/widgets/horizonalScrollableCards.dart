import 'package:flutter/material.dart';

class HorizontalScrollableCards extends StatelessWidget {
  final List<CardItem> items;

  const HorizontalScrollableCards({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: item.onTap,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 5,
                color: Colors.white,
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.icon != null)
                        Icon(
                          item.icon,
                          size: 32,
                          color: Colors.blue,
                        )
                      else if (item.imagePath != null)
                        Image.asset(
                          item.imagePath!,
                          width: 32,
                          height: 32,
                        ),
                      const SizedBox(height: 8),
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardItem {
  final IconData? icon;
  final String? imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  CardItem({
    this.icon,
    this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}
