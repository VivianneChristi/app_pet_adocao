import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryWidget({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Icon(icon, color: Colors.purple),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
