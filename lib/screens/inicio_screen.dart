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
        title: const Text('Canellas Panificação'),
        backgroundColor: Colors.green.shade100,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Encontre sua próxima receita!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Explore novas ideias para suas refeições.',
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 24),

          const Text(
            'Nossas receitas',
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