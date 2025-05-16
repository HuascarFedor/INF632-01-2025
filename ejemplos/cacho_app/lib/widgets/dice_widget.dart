import 'package:flutter/material.dart';

class DiceWidget extends StatelessWidget {
  final List<int> dice;
  final List<bool> isLocked;
  final Function(int) onTap;

  const DiceWidget({
    required this.dice,
    required this.isLocked,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => onTap(index),
          child: Container(
            margin: const EdgeInsets.all(8),
            width: 50,
            height: 50,
            color: isLocked[index] ? Colors.grey : Colors.blue,
            child: Center(
              child: Text(
                dice[index].toString(),
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      }),
    );
  }
}
