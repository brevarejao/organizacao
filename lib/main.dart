import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const DadoApp());
}

class DadoApp extends StatelessWidget {
  const DadoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo de Dados',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const DadoScreen(),
    );
  }
}

class DadoScreen extends StatefulWidget {
  const DadoScreen({Key? key}) : super(key: key);

  @override
  _DadoScreenState createState() => _DadoScreenState();
}

class _DadoScreenState extends State<DadoScreen> {
  int playerOne = 1;
  int playerTwo = 1;
  String result = "";

  // Mapa das imagens dos dados
  final Map<int, String> diceImages = {
    1: 'images/um.png',
    2: 'images/dois.png',
    3: 'images/tres.png',
    4: 'images/quatro.png',
    5: 'images/cinco.png',
    6: 'images/seis.png',
  };

  void rollDice() {
    setState(() {
      playerOne = Random().nextInt(6) + 1;
      playerTwo = Random().nextInt(6) + 1;
      if (playerOne > playerTwo) {
        result = "Jogador 1 Venceu";
      } else if (playerTwo > playerOne) {
        result = "Jogador 2 Venceu";
      } else {
        result = "Empate";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo de Dados'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Player 1: $playerOne',
              style: TextStyle(fontSize: 24),
            ),
            Image.asset(
              diceImages[playerOne]!,
              width: 100,
              height: 100,
            ),
            Text(
              'Player 2: $playerTwo',
              style: TextStyle(fontSize: 24),
            ),
            Image.asset(
              diceImages[playerTwo]!,
              width: 100,
              height: 100,
            ),
            Text(
              result,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: rollDice,
              child: Text('Rolar os Dados'),
            ),
          ],
        ),
      ),
    );
  }
}
