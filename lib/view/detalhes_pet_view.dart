import 'package:flutter/material.dart';

class DetalhesPetView extends StatelessWidget {
  final String name;
  final String age;
  final String price;
  final String distance;
  final String imageUrl;
  final String description;

  const DetalhesPetView({
    Key? key,
    required this.name,
    required this.age,
    required this.price,
    required this.distance,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Idade: $age',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Preço: $price',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Distância: $distance',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Descrição:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(description),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para adotar o pet
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Adoção'),
                      content: Text('Você deseja adotar $name?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$name adotado com sucesso!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Text('Adotar'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Adopt Me'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
