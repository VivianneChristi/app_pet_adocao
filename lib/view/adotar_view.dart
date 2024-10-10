import 'package:flutter/material.dart';

class AdotarView extends StatefulWidget {
  final List<Map<String, dynamic>> petsToAdopt;

  const AdotarView({Key? key, required this.petsToAdopt}) : super(key: key);

  @override
  _AdotarViewState createState() => _AdotarViewState();
}

class _AdotarViewState extends State<AdotarView> {
  bool showAdoptionRequirements = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seus pets', style: TextStyle(color: Colors.pink)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: widget.petsToAdopt.isEmpty
          ? const Center(
              child: Text('Nenhum pet adotado.'),
            )
          : Column(
              children: [
                // Exibir a lista de requisitos para adoção
                if (showAdoptionRequirements)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Requisitos para adotar um pet:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text('1. Ter um espaço adequado.'),
                            const Text('2. Garantir a alimentação.'),
                            const Text('3. Proporcionar amor e carinho.'),
                            const Text('4. Levar ao veterinário.'),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  showAdoptionRequirements =
                                      false; // Minimiza a lista
                                });
                              },
                              child: const Text('Entendi!'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.petsToAdopt.length,
                    itemBuilder: (context, index) {
                      final pet = widget.petsToAdopt[index];
                      return _petCard(pet);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _petCard(Map<String, dynamic> pet) {
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
      ),
    );
  }
}
