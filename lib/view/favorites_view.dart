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
    final isAdopted =
        pet['isAdopted'] ?? false; // Verifica se o pet foi adotado

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Image.asset(
          pet['imagePath'],
          fit: BoxFit.cover,
          width: 80,
          height: 80, // Altura fixa para tornar a imagem quadrada
        ),
        title: Container(
          width: double.infinity, // Ocupar 100% da largura
          child: Text(
            pet['name'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinha a coluna à esquerda
          children: [
            Text(
              pet['breed'], // Exibe a raça
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8), // Espaçamento entre a raça e o botão
            isAdopted
                ? ElevatedButton(
                    onPressed: null, // Desabilita o botão
                    child: Text('Você deu um lar a ${pet['name']}'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey, // Cor do botão após adoção
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      onAdoptPet(pet);
                      Navigator.pop(context);
                    },
                    child: const Text('Adotar'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pink, // Cor do botão
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
