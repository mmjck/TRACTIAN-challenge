import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const InfoRow({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(25),
        backgroundColor: Colors.blue,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildIcon(),
          const SizedBox(
            width: 20,
          ),
          _buildText()
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return const Icon(
      Icons.view_compact_rounded,
      size: 25,
      color: Colors.white,
    );
    ;
  }

  Widget _buildText() {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
