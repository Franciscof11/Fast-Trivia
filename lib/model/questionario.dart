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

  factory Questionario.fromMap(Map<String, dynamic> map) {
    return Questionario(
      id: map['id'] ?? 0,
      titulo: map['titulo'] ?? '',
      questoes:
          map['questoes'].map((map) => Questao.fromMap(map)) ?? <Questao>[],
    );
  }
}
