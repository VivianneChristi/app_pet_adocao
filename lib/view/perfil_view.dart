import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  final String userName;
  final String email;
  final String address; // Adicione o endereço
  // Adicione outros parâmetros conforme necessário, como senha

  const ProfileView({
    Key? key,
    required this.userName,
    required this.email,
    required this.address,
    required String userEmail,
  }) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isEditing = false; // Controla o modo de edição

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    // Inicializa os controladores com os valores atuais
    nameController = TextEditingController(text: widget.userName);
    emailController = TextEditingController(text: widget.email);
    addressController = TextEditingController(text: widget.address);
  }

  @override
  void dispose() {
    // Libera os controladores quando o widget for removido
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void toggleEditMode() {
    setState(() {
      isEditing = !isEditing; // Alterna o modo de edição
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user_avatar.png'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
              enabled:
                  isEditing, // Habilita apenas se estiver em modo de edição
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              enabled:
                  isEditing, // Habilita apenas se estiver em modo de edição
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Endereço',
                border: OutlineInputBorder(),
              ),
              enabled:
                  isEditing, // Habilita apenas se estiver em modo de edição
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: toggleEditMode, // Alterna entre editar e visualizar
              child: Text(isEditing ? 'Salvar' : 'Editar Perfil'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            ),
          ],
        ),
      ),
    );
  }
}
