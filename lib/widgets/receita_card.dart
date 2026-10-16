import 'package:canellas_panificacao/models/receita.dart';
import 'package:flutter/material.dart';

class ReceitaCard extends StatelessWidget {
  Receita? receita;
  GestureTapCallback? onTap;

  ReceitaCard({super.key, this.receita, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/receita_${receita?.id}.jpg',
              height: 190,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 190,
                  width: double.infinity,
                  color: Colors.green.shade50,
                  child: const Icon(
                    Icons.restaurant,
                    size: 60,
                    color: Colors.green,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    receita!.nome,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    receita!.descricao, 
                    // textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 18),
                      const SizedBox(width: 6),
                      Text('${receita!.tempoDePreparo} minutos'),
                      const Spacer(),
                      Text(receita!.categoria),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (!receita!.semGlutenVerificado)
                    const Text(
                      'Verificação alimentar pendente',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
