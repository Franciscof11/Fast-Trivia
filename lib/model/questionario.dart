import 'questao.dart';

class Questionario {
  final int id;
  final String titulo;
  final List<Questao> questoes;
  final String urlImageBanner;
  Questionario({
    required this.id,
    required this.titulo,
    required this.questoes,
    required this.urlImageBanner,
  });

  factory Questionario.fromMap(Map<String, dynamic> map) {
    return Questionario(
      id: map['id'] ?? 0,
      titulo: map['titulo'] ?? '',
      questoes: map['questoes']
              .map<Questao>((map) => Questao.fromMap(map))
              .toList() ??
          <Questao>[],
      urlImageBanner: map['urlImageBanner'] ?? '',
    );
  }
}
