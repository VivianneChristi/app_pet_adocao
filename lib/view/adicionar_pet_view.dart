import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String age;
  final String price;
  final String distance;

  const PetCard({
    required this.name,
    required this.age,
    required this.price,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/cat_image.png'),
        ),
        title: Text(name),
        subtitle: Text('$age • $distance'),
        trailing: Text(price),
      ),
    );
  }
}
