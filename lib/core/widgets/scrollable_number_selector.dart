// ignore_for_file: library_private_types_in_public_api, use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';

class ScrollableNumberSelector extends StatefulWidget {
  final double selectedAge;
  final ScrollController scrollController;
  final Function(double) onAgeSelected;

  const ScrollableNumberSelector({
    Key? key,
    required this.selectedAge,
    required this.scrollController,
    required this.onAgeSelected,
  }) : super(key: key);

  @override
  _ScrollableNumberSelectorState createState() =>
      _ScrollableNumberSelectorState();
}

class _ScrollableNumberSelectorState extends State<ScrollableNumberSelector> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.8;

    return Container(
      width: containerWidth,
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 235, 235),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 7, 66, 100),
                  ),
                ),
                Container(
                  width: 2,
                  height: 40,
                  color: const Color.fromARGB(255, 7, 66, 100),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(100, (index) {
                double scale = 1.0;
                Color numberColor = Colors.grey[400]!;

                if (widget.selectedAge == index.toDouble()) {
                  scale = 1.5;
                  numberColor = Colors.black;
                } else if ((widget.selectedAge - index).abs() == 1) {
                  numberColor = Colors.grey[800]!;
                } else if ((widget.selectedAge - index).abs() == 2) {
                  numberColor = Colors.grey[600]!;
                }

                return GestureDetector(
                  onTap: () {
                    widget.onAgeSelected(index.toDouble());
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Transform.scale(
                          scale: scale,
                          child: Text(
                            index.toString(),
                            style: TextStyle(
                              color: numberColor,
                              fontWeight: widget.selectedAge == index.toDouble()
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: widget.selectedAge == index.toDouble()
                                  ? 24
                                  : 18,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 2,
                          height: 30,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 1,
                              height: 10,
                              color: Colors.grey,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            Container(
                              width: 1,
                              height: 10,
                              color: Colors.grey,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            Container(
                              width: 1,
                              height: 10,
                              color: Colors.grey,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
