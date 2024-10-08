import 'package:flutter/material.dart';
import 'package:pet_adoption/widgets/custom_text_field.dart';

class CadastroView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Crie sua conta',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Nome',
                controller: _nameController,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'E-mail',
                controller: _emailController,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Senha',
                obscureText: true,
                controller: _passwordController,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Cadastro realizado com sucesso!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      // Aqui você pode adicionar lógica para redirecionar ou salvar dados
                    }
                  },
                  child: Text('Cadastrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
