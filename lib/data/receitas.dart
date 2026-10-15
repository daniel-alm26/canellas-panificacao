import "../models/receita.dart";

List<Receita> receitas = [
  Receita(
    id: 1,
    nome: 'Panqueca de banana',
    descricao: 'Uma opção simples para o café da manhã',
    tempoDePreparo: 15,
    rendimento: 2,
    ingredientes: [
      '2 bananas',
      '2 ovos',
      'Canela a gosto',
    ],
    modoDePreparo: [
      'Amasse as bananas.',
      'Misture com os ovos e a canela.',
      'Cozinhe pequenas porções em uma frigideira.',
    ],
    categoria: 'Café da manhã',
    semGlutenVerificado: true,
  ),
  Receita(
    id: 2,
    nome: 'Bolo de cenoura',
    descricao: 'Uma opção para o café da manhã',
    tempoDePreparo: 45,
    rendimento: 8,
    ingredientes: [
      '2 cenouras',
      '3 ovos',
      '1 xícara de farinha de arroz',
      'Açúcar e óleo conforme a receita válida',
    ],
    modoDePreparo: [
      'Prepare os ingredientes conforme a receita validada.',
      'Misture os ingredientes.',
      'Asse até ficar pronto.',
    ],
    categoria: 'Bolos',
    semGlutenVerificado: false,
  )
];