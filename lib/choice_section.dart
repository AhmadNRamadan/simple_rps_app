import 'package:flutter/material.dart';

class ChoiceSection extends StatelessWidget {
  const ChoiceSection({super.key, required this.player, required this.choice});
  final String player;
  final IconData choice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text(
          player,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Icon(
          choice,
          color:
              choice == Icons.question_mark ? Colors.redAccent : Colors.amber,
          size: 24,
        ),
      ],
    );
  }
}
