class Receita {
  final int id;
  final String nome;
  final String descricao;
  final int tempoDePreparo;
  final int rendimento;
  final List<String> ingredientes;
  final List<String> modoDePreparo;
  final String categoria;
  final bool semGlutenVerificado;

  Receita({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.tempoDePreparo,
    required this.rendimento,
    required this.ingredientes,
    required this.modoDePreparo,
    required this.categoria,
    required this.semGlutenVerificado,
  });
}
