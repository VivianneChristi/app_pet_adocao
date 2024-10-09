import 'package:flutter/material.dart';

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
            const Text(
              'Informações do Usuário',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _infoCard('Nome', userName),
            _infoCard('E-mail', userEmail),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para editar o perfil do usuário
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink, // Cor do botão
              ),
              child: const Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(value, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
