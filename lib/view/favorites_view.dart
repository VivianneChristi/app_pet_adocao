import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  final List<Map<String, dynamic>> favoritePets;
  final Function(Map<String, dynamic>) onAdoptPet;
  final Function(Map<String, dynamic>) onRemoveFavorite;

  const FavoritesView({
    Key? key,
    required this.favoritePets,
    required this.onAdoptPet,
    required this.onRemoveFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos', style: TextStyle(color: Colors.pink)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: favoritePets.isEmpty
          ? const Center(
              child: Text('Nenhum favorito encontrado.'),
            )
          : ListView.builder(
              itemCount: favoritePets.length,
              itemBuilder: (context, index) {
                final pet = favoritePets[index];
                return _petCard(pet, context);
              },
            ),
    );
  }

  Widget _petCard(Map<String, dynamic> pet, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Image.asset(
          pet['imagePath'],
          fit: BoxFit.cover,
          width: 80,
        ),
        title: Text(pet['name'],
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(pet['breed']),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                onAdoptPet(pet);
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.pets, color: Colors.brown),
              onPressed: () {
                onRemoveFavorite(pet);
              },
            ),
          ],
        ),
      ),
    );
  }
}
