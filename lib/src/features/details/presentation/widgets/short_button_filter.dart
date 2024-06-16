import 'package:flutter/material.dart';

class ShortButtonFilter extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPressed;
  final bool isSelected;

  const ShortButtonFilter({
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(0),
      ),
      onPressed: onPressed,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border:
              isSelected ? null : Border.all(color: Colors.grey, width: 0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              _buildImage(),
              const SizedBox(
                width: 10,
              ),
              _buildText()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Icon(
      icon,
      size: 20,
      color: isSelected ? Colors.white : Colors.grey,
    );
  }

  Widget _buildText() {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: isSelected ? Colors.white : Colors.grey,
      ),
    );
  }
}
