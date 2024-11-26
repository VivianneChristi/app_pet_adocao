import 'package:flutter/material.dart';

class AdicionarPetView extends StatefulWidget {
  @override
  _AdicionarPetViewState createState() => _AdicionarPetViewState();
}

class _AdicionarPetViewState extends State<AdicionarPetView> {
  final _formKey = GlobalKey<FormState>();
  String _petName = '';
  String _petBreed = '';
  String _petDescription = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Novo Pet'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome do Pet',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do pet';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _petName = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Raça do Pet',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a raça do pet';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _petBreed = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descrição do Pet',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                onChanged: (value) {
                  setState(() {
                    _petDescription = value;
                  });
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Após validação, você pode fazer a lógica para adicionar o pet ao backend
                    print(
                        'Pet adicionado: Nome: $_petName, Raça: $_petBreed, Descrição: $_petDescription');

                    Navigator.pop(context); // Fecha a tela de adicionar pet
                  }
                },
                child: Text('Adicionar Pet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
