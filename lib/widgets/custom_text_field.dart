import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller; // Controlador

  const CustomTextField({
    required this.label,
    this.obscureText = false,
    required this.controller, // Adicionando o controlador ao construtor
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Usando o controlador
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        // Validação dos campos
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha este campo';
        }
        if (label == 'E-mail' &&
            !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Por favor, insira um e-mail válido';
        }
        if (label == 'Senha' && value.length < 6) {
          return 'A senha deve ter pelo menos 6 caracteres';
        }
        return null;
      },
    );
  }
}
