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
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 124 / 210,
                ),
                itemCount: favoritePets.length,
                itemBuilder: (context, index) {
                  final pet = favoritePets[index];
                  return _petCard(pet, context);
                },
              ),
            ),
    );
  }

  Widget _petCard(Map<String, dynamic> pet, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Comportamento ao clicar no card (opcional)
      },
      child: Container(
        width: 124,
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                pet['imagePath'],
                fit: BoxFit.cover,
                height: 160,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    pet['genderIcon'],
                    color: pet['genderColor'],
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    pet['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                pet['breed'],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (!pet['isAdopted']) {
                    onAdoptPet(pet); // Adota o pet
                    onRemoveFavorite(pet); // Remove o pet dos favoritos
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  pet['isAdopted'] ? 'Adotado' : 'Adotar',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
