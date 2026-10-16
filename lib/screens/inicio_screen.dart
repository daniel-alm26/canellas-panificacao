import 'package:canellas_panificacao/data/receitas.dart';
import 'package:canellas_panificacao/screens/detalhes_receita_screen.dart';
import 'package:canellas_panificacao/widgets/receita_card.dart';
import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        // title: const Text('Canellas Panificação'),
        centerTitle: true,
        backgroundColor: Colors.green.shade100,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Encontre sua próxima receita!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Explore novas ideias para suas refeições.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 24),

          const Text(
            'Nossas receitas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          ...receitas.map(
            (receita) => ReceitaCard(
              receita: receita,
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) =>
                      DetalhesReceitaScreen(
                        receita: receita
                      ),
                  ),
                );
              },
            )
          )
        ],
      ),
    );
  }
}