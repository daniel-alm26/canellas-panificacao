import 'package:canellas_panificacao/data/receitas.dart';
import 'package:canellas_panificacao/models/receita.dart';
import 'package:flutter/material.dart';

class FormularioReceitaScreen extends StatefulWidget {
  const FormularioReceitaScreen({super.key});

  @override
  State<FormularioReceitaScreen> createState() =>
      _FormularioReceitaScreenState();
}

class _FormularioReceitaScreenState extends State<FormularioReceitaScreen> {
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _tempoController = TextEditingController();
  final _rendimentoController = TextEditingController();
  final _ingredientesController = TextEditingController();
  final _modoPreparoController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _tempoController.dispose();
    _rendimentoController.dispose();
    _ingredientesController.dispose();
    _modoPreparoController.dispose();
    super.dispose();
  }

  // Método dispose(): Função de limpeza usada para liberar recursoso de memória e evitar vazamentos.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Receita'),
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cadastre sua receita',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome da Receita',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _descricaoController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _ingredientesController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Ingredientes',
                hintText: 'Digite um ingriente por linha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _modoPreparoController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Modo de preparo',
                hintText: 'Digite uma etapa por linha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _tempoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tempo de preparo (minutos)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _rendimentoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Rendimento (porções)',
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _salvarReceita,
                icon: const Icon(Icons.save),
                label: const Text('Salvar receita'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _salvarReceita() {
    final nome = _nomeController.text.trim();
    final descricao = _descricaoController.text.trim();
    final tempo = int.tryParse(_rendimentoController.text);
    final rendimento = int.tryParse(_rendimentoController.text);
    final ingredientes = _ingredientesController.text
      .split('\n')
      .map((item) => item.trim())
      .where((item) => item.isNotEmpty)
      .toList();
    final modoPreparo = _modoPreparoController.text
      .split('\n')
      .map((item) => item.trim())
      .where((etapa) => etapa.isNotEmpty)
      .toList();

    if (nome.isEmpty ||
        descricao.isEmpty ||
        tempo == null ||
        rendimento == null ||
        rendimento <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Preencha todos os dados corretamente.',
          ),
        ),
      );
      return;
    }

    final novaReceita = Receita(
      id: receitas.isEmpty ? 1 : receitas
        .map((receita) => receita.id)
        .reduce((a, b) => a > b ? a : b) + 1, 
        nome: nome, 
        descricao: descricao, 
        tempoDePreparo: tempo, 
        rendimento: rendimento, 
        ingredientes: ingredientes, 
        modoDePreparo: modoPreparo, 
        categoria: 'Outras', 
        semGlutenVerificado: false,
    );

    receitas.add(novaReceita);

    Navigator.pop(context);
  }
}
