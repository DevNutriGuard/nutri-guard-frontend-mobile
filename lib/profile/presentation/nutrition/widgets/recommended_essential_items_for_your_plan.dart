import 'package:flutter/material.dart';

class RecommendedEssentialItemsForYourPlan extends StatefulWidget {
  const RecommendedEssentialItemsForYourPlan({super.key});

  @override
  State<RecommendedEssentialItemsForYourPlan> createState() =>
      _RecommendedEssentialItemsForYourPlanState();
}

class _RecommendedEssentialItemsForYourPlanState
    extends State<RecommendedEssentialItemsForYourPlan> {
  final List<Map<String, dynamic>> items = [
    {
      "name": "Cookies",
      "image": "assets/images/cookie.png",
      "selected": false,
    },
    {
      "name": "Fruits",
      "image": "assets/images/fruits.png",
      "selected": false,
    },
    {
      "name": "Fresh Broccoli",
      "image": "assets/images/broccoli.png",
      "selected": false,
    },
    {
      "name": "Milk",
      "image": "assets/images/milk.png",
      "selected": false,
    },
  ];

  void toggleSelection(int index) {
    setState(() {
      items[index]['selected'] = !items[index]['selected'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 212, 212, 212),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recommended essential items for your plan",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          item['image'],
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Text(
                            item['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Icon(
                          item['selected']
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: item['selected']
                              ? Colors.green
                              : Colors.grey.shade400,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
