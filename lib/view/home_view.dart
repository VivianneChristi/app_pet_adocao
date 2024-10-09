import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> favoritePets = [];

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
            onPressed: () {
              // Lógica para filtros
            },
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _petCard('assets/images/dog1.png', 'Canela', 'Pitbull',
                        Icons.female, Colors.pink),
                    _petCard('assets/images/dog2.png', 'Duke', 'Golden',
                        Icons.male, Colors.blue),
                    _petCard('assets/images/dog3.png', 'Nemo', 'Criollo',
                        Icons.male, Colors.blue),
                  ],
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _petCard('assets/images/cat1.png', 'Canela', 'Mestiza',
                        Icons.female, Colors.pink),
                    _petCard('assets/images/cat2.png', 'Thor', 'Pixie',
                        Icons.male, Colors.blue),
                    _petCard('assets/images/cat3.png', 'Duke', 'Somali',
                        Icons.male, Colors.blue),
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
            // Navegação para a tela inicial (Home)
            // Lógica para a tela inicial, se necessário
          } else if (index == 1) {
            // Navegação para a página de favoritos
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FavoritesView(favoritePets: favoritePets)),
            );
          } else if (index == 2) {
            // Lógica para reportar, se necessário
          } else if (index == 3) {
            // Navegação para a página de perfil
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PerfilView(
                  userName: 'Seu Nome', // Substitua pelo nome do usuário
                  userEmail:
                      'seuemail@example.com', // Substitua pelo e-mail do usuário
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
            icon: Icon(Icons.report),
            label: 'Reportar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget _petCard(String imagePath, String name, String breed,
      IconData genderIcon, Color genderColor) {
    bool isFavorite = favoritePets.contains(name);
    return GestureDetector(
      onTap: () {
        // Navegar para a página de detalhes do pet
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesPetView(name: name, breed: breed),
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
                    imagePath,
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
                      Icons.pets,
                      color: isFavorite ? Colors.amber : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isFavorite) {
                          favoritePets.remove(name);
                        } else {
                          favoritePets.add(name);
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      Icon(genderIcon, color: genderColor, size: 18),
                    ],
                  ),
                  Text(
                    breed,
                    style: const TextStyle(color: Colors.pink),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetalhesPetView extends StatelessWidget {
  final String name;
  final String breed;

  const DetalhesPetView({Key? key, required this.name, required this.breed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/images/dog1.png',
                fit: BoxFit.cover), // Trocar pela imagem correta
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Raça: $breed',
              style: const TextStyle(fontSize: 18),
            ),
            // Adicione mais informações aqui, como idade, peso, etc.
          ],
        ),
      ),
    );
  }
}

class FavoritesView extends StatelessWidget {
  final List<String> favoritePets;

  const FavoritesView({Key? key, required this.favoritePets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos', style: TextStyle(color: Colors.pink)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: favoritePets
              .map((pet) => ListTile(
                    title: Text(pet),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class PerfilView extends StatelessWidget {
  final String userName;
  final String userEmail;

  const PerfilView({Key? key, required this.userName, required this.userEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil', style: TextStyle(color: Colors.pink)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: $userName',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: $userEmail',
              style: const TextStyle(fontSize: 18),
            ),
            // Adicione mais informações do usuário aqui
          ],
        ),
      ),
    );
  }
}
