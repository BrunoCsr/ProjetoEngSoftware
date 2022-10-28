import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final String title;
  final int id;
  final bool completed;
  const ToDoCard({
    super.key,
    required this.title,
    required this.id,
    required this.completed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
          border: Border.all(width: 2, color: Colors.amber)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.amber),
          ),
          Text(
            id.toString(),
            style: const TextStyle(color: Colors.amber),
          ),
          Text(
            completed.toString(),
            style: const TextStyle(color: Colors.amber),
          )
        ],
      ),
    );
  }
}
