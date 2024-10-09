import 'package:flutter/material.dart';

class TelaDeEntradaView extends StatelessWidget {
  const TelaDeEntradaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
              'assets/images/dog.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Adop',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE42C64),
                          ),
                        ),
                        TextSpan(
                          text: 'Pets',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF321BA4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Bem-vindo!',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF321BA4),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF321BA4),
                      fixedSize: const Size(328, 48),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text(
                      'Iniciar Sessão',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cadastro');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: const Size(328, 48),
                      side: const BorderSide(color: Color(0xFF321BA4)),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text(
                      'Criar Conta',
                      style: TextStyle(color: Color(0xFF321BA4)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ou registre-se com',
                    style: TextStyle(color: Color(0xFF321BA4)),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.facebook,
                            color: Color(0xFF321BA4)),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.email, color: Color(0xFF321BA4)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Image.asset(
              'assets/images/splash_pink.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
