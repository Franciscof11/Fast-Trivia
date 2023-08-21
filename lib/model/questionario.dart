import 'questao.dart';

class Questionario {
  final int id;
  final String titulo;
  final List<Questao> questoes;

  Questionario({
    required this.id,
    required this.titulo,
    required this.questoes,
  });
}
