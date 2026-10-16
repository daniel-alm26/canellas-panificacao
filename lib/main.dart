import 'package:canellas_panificacao/screens/inicio_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CanellasPanificacaoApp());

class CanellasPanificacaoApp extends StatelessWidget {
  const CanellasPanificacaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canellas Panificação',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: InicioScreen(),
    );
  }
}

