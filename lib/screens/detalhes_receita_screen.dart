import 'package:canellas_panificacao/models/receita.dart';
import 'package:flutter/material.dart';

class DetalhesReceitaScreen extends StatelessWidget {
  final Receita receita;

  const DetalhesReceitaScreen({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receita.nome)),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/receita_${receita.id}.jpg',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 250,
                color: Colors.green.shade50,
                child: const Icon(
                  Icons.restaurant,
                  size: 70,
                  color: Colors.green,
                ),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  receita.nome,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(receita.descricao),

                const SizedBox(height: 12),

                Text('Tempo de preparo: ${receita.tempoDePreparo} minutos'),
                Text('Rendimento: ${receita.rendimento} porções'),

                const SizedBox(height: 16),

                if (!receita.semGlutenVerificado)
                  const Text(
                    'Atenção: esta receita ainda não foi configurada '
                    'quanto à segurança para pessoas com restrição '
                    'ao glúten.',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                const SizedBox(height: 24),

                const Text(
                  'Ingredientes',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                ...receita.ingredientes.map(
                  (ingrediente) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• '),
                        Expanded(child: Text(ingrediente)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'Modo de preparo',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                ...receita.modoDePreparo.asMap().entries.map(
                  (entrada) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${entrada.key + 1}. '),
                        Expanded(child: Text(entrada.value)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
