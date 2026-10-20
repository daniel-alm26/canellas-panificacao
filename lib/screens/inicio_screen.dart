import 'package:canellas_panificacao/data/receitas.dart';
import 'package:canellas_panificacao/screens/detalhes_receita_screen.dart';
import 'package:canellas_panificacao/screens/formulario_receita_screen.dart';
import 'package:canellas_panificacao/widgets/receita_card.dart';
import 'package:flutter/material.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  String textoPesquisa = '';
  String categoriaSelecionada = 'Todas';

  @override
  Widget build(BuildContext context) {
    final receitasFiltradas = receitas.where((receita) {
      final correspondeNome = receita.nome
        .toLowerCase()
        .contains(textoPesquisa.toLowerCase());
    
      final correspondeCategoria = categoriaSelecionada == 'Todas' || receita.categoria == categoriaSelecionada;

    return correspondeNome && correspondeCategoria;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 40),
        // title: const Text('Canellas Panificação'),
        centerTitle: true,
        backgroundColor: Colors.green.shade100,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Adicionar receita',
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FormularioReceitaScreen(),
                ),
              );

              setState(() {});
            },
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Encontre sua próxima receita!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                borderRadius: BorderRadius.circular(16),
              ),
            ),

            onChanged: (texto) {
              setState(() {
                textoPesquisa = texto;
              });
            },
          ),

          const SizedBox(height: 12),

          DropdownButtonFormField<String>(
            initialValue: categoriaSelecionada,
            decoration: const InputDecoration(
              labelText: 'Filtrar por categoria',
              border: OutlineInputBorder(),
            ),

            items: const[
              DropdownMenuItem(
                value: 'Todas',
                child: Text('Todas as categorias'),
              ),
              DropdownMenuItem(
                value: 'Café da manhã',
                child: Text('Café da manhã'),
              ),
              DropdownMenuItem(
                value: 'Almoço',
                child: Text('Almoço'),
              ),
              DropdownMenuItem(
                value: 'Jantar',
                child: Text('Jantar'),
              ),
              DropdownMenuItem(
                value: 'Sobremesa',
                child: Text('Sobremesa'),
              ),
              DropdownMenuItem(
                value: 'Outras',
                child: Text('Outras'),
              ),
            ],
            onChanged: (categoria) {
              if (categoria == null) return;

              setState(() {
                categoriaSelecionada = categoria;
              });
            },
          ),

          const SizedBox(height: 24),

          const Text(
            'Receitas',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
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
                          DetalhesReceitaScreen(receita: receita),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
