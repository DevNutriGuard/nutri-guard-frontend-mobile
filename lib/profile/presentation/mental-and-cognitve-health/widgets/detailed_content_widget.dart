import 'package:flutter/material.dart';

class DetailedContentWidget extends StatelessWidget {
  final String? title;
  final String? imageTitle;
  final String? imagePath;
  final String? paragraph;
  final String? card1Title;
  final String? card1Paragraph;
  final String? card2Paragraph;

  const DetailedContentWidget({
    super.key,
    this.title,
    this.imageTitle,
    this.imagePath,
    this.paragraph,
    this.card1Title,
    this.card1Paragraph,
    this.card2Paragraph,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            if (title != null) const SizedBox(height: 16),
            if (imageTitle != null || imagePath != null || paragraph != null)
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (imageTitle != null)
                      Text(
                        imageTitle!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    if (imageTitle != null) const SizedBox(height: 16),
                    if (imagePath != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          imagePath!,
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                      ),
                    if (imagePath != null) const SizedBox(height: 16),
                    if (paragraph != null) Text(paragraph!),
                  ],
                ),
              ),
            if (imageTitle != null || imagePath != null || paragraph != null)
              const SizedBox(height: 16),
            if (card1Title != null || card1Paragraph != null)
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (card1Title != null)
                          Text(
                            card1Title!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        if (card1Title != null) const SizedBox(height: 8),
                        if (card1Paragraph != null) Text(card1Paragraph!),
                      ],
                    ),
                  ),
                ),
              ),
            if (card1Title != null || card1Paragraph != null)
              const SizedBox(height: 16),
            if (card2Paragraph != null)
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(card2Paragraph!),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
