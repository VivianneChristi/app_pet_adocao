import 'package:flutter/material.dart';
import '../widgets/pet_card.dart'; // Certifique-se de que o caminho esteja correto

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bring Us Home', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Ação de pesquisa
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Street pets need protection',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: Text('Donate Now'),
            ),
            SizedBox(height: 20),
            Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryWidget(icon: Icons.pets, label: 'Dogs'),
                CategoryWidget(icon: Icons.pets, label: 'Cats'),
                CategoryWidget(icon: Icons.pets, label: 'Birds'),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  PetCard(
                    petName: 'Bello',
                    petAge: '9 Months old',
                    petPrice: '\$180',
                    petDistance: '1.6 km away',
                    imageUrl: 'assets/images/cat_image.png',
                    description: 'Bello is a playful dog.',
                  ),
                  PetCard(
                    petName: 'Mimi',
                    petAge: '2 Years old',
                    petPrice: '\$200',
                    petDistance: '2 km away',
                    imageUrl: 'assets/images/cat_image.png',
                    description: 'Mimi is a loving cat.',
                  ),
                  // Adicione mais PetCards conforme necessário
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryWidget({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          radius: 30,
          child: Icon(icon, color: Colors.purple, size: 30),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
