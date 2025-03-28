import 'package:flutter/material.dart';

class CheckOptionTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function(bool?) onChanged;

  CheckOptionTile({
    required this.title,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isSelected),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey.shade200,
          border: Border.all(
            color: isSelected
                ? const Color.fromARGB(255, 44, 77, 104)
                : Colors.grey.shade300,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color.fromARGB(255, 44, 77, 104)
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? const Color.fromARGB(255, 44, 77, 104)
                      : Colors.grey,
                  width: 2.0,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
