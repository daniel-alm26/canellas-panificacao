import "../models/receita.dart";

final List<Receita> receitas = [
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
  ),
  Receita(
    id: 3,
    nome: 'Bolo de Milho sem glutén e sem lactose',
    descricao: 'Esse bolo de milho sem glúten e sem lactose te mostrará que você não precisa de farinha '
                'de trigo e nem de produtos derivados de leite para ter uma sobremesa supersaborosa! '
                'Ele é ideal para deixar aquele cafézinho da tarde ainda mais especial, além de possibilitar ' 
                'que celíacos ou intolerantes possam se deliciar com essa maravilha.',
    tempoDePreparo: 35,
    rendimento: 3,
    ingredientes: [
      '1 xícara (chá) de leite de coco (200 ml)',
      '1 xícara (chá) de fubá de milho',
      '2 ovos',
      '1 xícara (chá) de açúcar',
      '1 xícara (chá) de milho verde',
      '3 colheres (sopa) de óleo de coco',
      '3 colheres (sopa) de coco ralado',
      '1 colher (sopa) de fermento em pó',
    ],
    modoDePreparo: [
      'Coloque no liquidificador todos os ingredientes, exceto o fermento, e bata até misturar tudo.',
      'Em seguida, acrescente o fermento e misture com uma colher (tire o copo do liquidificador da base para evitar acidentes).',
      'Unte a forma com óleo de coco e fubá e despeje a mistura.',
      'Leve ao forno em temperatura de 180º C por cerca de 30 minutos.',
    ],
    categoria: 'Massas',
    semGlutenVerificado: true,
  )
];