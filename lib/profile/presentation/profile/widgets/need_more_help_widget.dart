import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import '../../../../../res/assets.dart';

class NeedMoreHelpWidget extends StatelessWidget {
  const NeedMoreHelpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      SuggestionsCardItem(
        imagePath: Assets.note,
        title: 'Ask for the help',
        subtitle: 'Get answers from community experts.',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenA(),
            ),
          );
        },
      ),
      SuggestionsCardItem(
        imagePath: Assets.like,
        title: 'Happy with us?',
        subtitle: 'We\'re delighted to receive your feedback!',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenB(),
            ),
          );
        },
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(2.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Need more help?',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          fontFamily: "Inter Tight"
                      ),
                    ),
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(4),
                        child: SvgPicture.asset(Assets.moreIcon),
                      )
                    )
                  ],
                ),

                const SizedBox(height: 8),
                const SizedBox(height: 5),
                NeedMoreHelpCards(items: items),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NeedMoreHelpCards extends StatelessWidget {
  final List<SuggestionsCardItem> items;

  const NeedMoreHelpCards({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: item.onTap,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 5,
                color: Colors.white,
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ],
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

class SuggestionsCardItem {
  final IconData? icon;
  final String? imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  SuggestionsCardItem({
    this.icon,
    this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen A')),
      body: const Center(child: Text('This is Screen A')),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen B')),
      body: const Center(child: Text('This is Screen B')),
    );
  }
}
