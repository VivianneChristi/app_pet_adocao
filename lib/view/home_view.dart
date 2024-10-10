import 'package:flutter/material.dart';
import 'package:pet_adoption/view/detalhes_pet_view.dart';
import 'package:pet_adoption/view/favorites_view.dart';
import 'package:pet_adoption/view/perfil_view.dart';
import 'package:pet_adoption/view/adotar_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>> favoritePets = [];
  List<Map<String, dynamic>> petsToAdopt = [];

  // Lista de pets disponíveis (cães)
  List<Map<String, dynamic>> availableDogs = [
    {
      'imagePath': 'assets/images/dog1.png',
      'name': 'Canela',
      'breed': 'Pitbull',
      'genderIcon': Icons.female,
      'genderColor': Colors.pink,
      'description': 'Muito dócil e brincalhona.',
      'isAdopted': false,
    },
    {
      'imagePath': 'assets/images/dog2.png',
      'name': 'Luke',
      'breed': 'Golden',
      'genderIcon': Icons.male,
      'genderColor': Colors.blue,
      'description': 'Adora nadar e buscar bolinhas.',
      'isAdopted': false,
    },
    {
      'imagePath': 'assets/images/dog3.png',
      'name': 'Nemo',
      'breed': 'Criollo',
      'genderIcon': Icons.male,
      'genderColor': Colors.blue,
      'description': 'Cheio de energia e ama correr.',
      'isAdopted': false,
    },
  ];

  // Lista de pets disponíveis (gatos)
  List<Map<String, dynamic>> availableCats = [
    {
      'imagePath': 'assets/images/cat1.png',
      'name': 'Amendoa',
      'breed': 'Mestiza',
      'genderIcon': Icons.female,
      'genderColor': Colors.pink,
      'description': 'Muito curiosa e independente.',
      'isAdopted': false,
    },
    {
      'imagePath': 'assets/images/cat2.png',
      'name': 'Thor',
      'breed': 'Pixie',
      'genderIcon': Icons.male,
      'genderColor': Colors.blue,
      'description': 'Gosta de alturas e explorar.',
      'isAdopted': false,
    },
    {
      'imagePath': 'assets/images/cat3.png',
      'name': 'Duke',
      'breed': 'Somali',
      'genderIcon': Icons.male,
      'genderColor': Colors.blue,
      'description': 'Muito carinhoso e dócil.',
      'isAdopted': false,
    },
  ];

  void markPetAsAdopted(Map<String, dynamic> pet) {
    setState(() {
      pet['isAdopted'] = true;
      petsToAdopt.add(pet);
      if (availableDogs.contains(pet)) {
        availableDogs.remove(pet);
      } else if (availableCats.contains(pet)) {
        availableCats.remove(pet);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdopPets', style: TextStyle(color: Colors.pink)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.pink),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Cães',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: availableDogs.length,
                  itemBuilder: (context, index) {
                    final pet = availableDogs[index];
                    return _petCard(pet);
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Gatos',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: availableCats.length,
                  itemBuilder: (context, index) {
                    final pet = availableCats[index];
                    return _petCard(pet);
                  },
                ),
              ),
              if (petsToAdopt.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pets Indisponíveis',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        children: petsToAdopt.map((pet) {
                          return _adoptedPetCard(pet);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            // Lógica para tela inicial
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoritesView(
                  favoritePets: favoritePets,
                  onAdoptPet: markPetAsAdopted,
                  onRemoveFavorite: (Map<String, dynamic> pet) {
                    setState(() {
                      favoritePets.remove(pet);
                      markPetAsAdopted(pet);
                    });
                  },
                ),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdotarView(petsToAdopt: petsToAdopt),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PerfilView(
                  userName: 'Seu Nome',
                  userEmail: 'seuemail@example.com',
                ),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_rounded),
            label: 'Adotar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget _petCard(Map<String, dynamic> pet) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesPetView(
              name: pet['name'],
              breed: pet['breed'],
              imagePath: pet['imagePath'],
              age: '2 anos',
              weight: '15 kg',
              gender: pet['genderIcon'] == Icons.female ? 'Fêmea' : 'Macho',
              description: ' ',
              onAdopt: () {
                markPetAsAdopted(pet);
              },
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    pet['imagePath'],
                    fit: BoxFit.cover,
                    height: 120,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      favoritePets.contains(pet)
                          ? Icons.pets
                          : Icons.pets_outlined,
                      color: favoritePets.contains(pet)
                          ? Colors.amber
                          : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        if (!favoritePets.contains(pet)) {
                          favoritePets.add(pet);
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          pet['genderIcon'],
                          color: pet['genderColor'],
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          pet['breed'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _adoptedPetCard(Map<String, dynamic> pet) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              pet['imagePath'],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Pet encontrou um novo lar!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
