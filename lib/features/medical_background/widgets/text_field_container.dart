import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class TextFieldContainer extends StatefulWidget {
  const TextFieldContainer({super.key});

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _chips = [];

  void _addChip() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _chips.add(_controller.text.trim());
        _controller.clear();
      });
    }
  }

  void _removeChip(String chip) {
    setState(() {
      _chips.remove(chip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.boxShadowColor,
            blurRadius: 0,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: _chips
                .map((chip) => Chip(
                      label: Text(chip),
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () => _removeChip(chip),
                    ))
                .toList(),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText:
                        "Please enter your diagnosed medical conditions (if any).",
                    hintStyle: TextStyle(
                      fontFamily: "Inter Tight",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                      color: AppColors.greyTextColor,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    fontFamily: "Inter Tight",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    color: Colors.black,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: AppColors.primaryColor),
                onPressed: _addChip,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
