import 'package:flutter/material.dart';
import '../view/detalhes_pet_view.dart';

class PetCard extends StatelessWidget {
  final String petName;
  final String petAge;
  final String petWeight;
  final String petGender;
  final String imageUrl;
  final String description;

  const PetCard({
    Key? key,
    required this.petName,
    required this.petAge,
    required this.petWeight,
    required this.petGender,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalhesPetView(
                name: petName,
                age: petAge,
                weight: petWeight,
                gender: petGender,
                imagePath: imageUrl,
                description: description,
                breed: '',
                onAdopt: () {},
              ),
            ),
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Image.asset(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(petName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(petAge, style: TextStyle(fontSize: 14)),
                  SizedBox(height: 4),
                  Text(petWeight, style: TextStyle(fontSize: 14)),
                  SizedBox(height: 4),
                  Text(petGender, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
