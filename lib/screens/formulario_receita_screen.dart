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

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _tempoController.dispose();
    _rendimentoController.dispose();
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
                onPressed: () {},
                icon: const Icon(Icons.save),
                label: const Text('Salvar receita'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
