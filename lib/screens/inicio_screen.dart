import 'package:canellas_panificacao/data/receitas.dart';
import 'package:canellas_panificacao/screens/detalhes_receita_screen.dart';
import 'package:canellas_panificacao/widgets/receita_card.dart';
import 'package:flutter/material.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

  class _InicioScreenState extends State<InicioScreen> {
    String textoPesquisa = '';

  @override
  Widget build(BuildContext context) {
    final receitasFiltradas = receitas.where((receita) {
      return receita.nome
        .toLowerCase()
        .contains(textoPesquisa.toLowerCase());
    }).toList();

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

          const SizedBox(height: 20),

          TextField(
            decoration: InputDecoration(
              hintText: 'Pesquisar receitas...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            onChanged: (texto) {
              setState(() {
                textoPesquisa = texto;
              });
            },
          ),

          const SizedBox(height: 24),

          const Text(
            'Receitas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          if (receitasFiltradas.isEmpty)
            const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Nenhuma receita encontrada.',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          else
          ...receitasFiltradas.map(
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
 

