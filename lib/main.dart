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

class InicioScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canellas Pacificação'),
      ),
      body: Center(
        child: Text(
          'Encontre sua próxima receita!',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,          
        ),
      ),
    );
  }
}
