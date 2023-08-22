import 'alternativa.dart';

class Questao {
  final int id;
  final String pergunta;
  final int gabarito;
  final List<Alternativa> alternativas;

  Questao({
    required this.id,
    required this.pergunta,
    required this.gabarito,
    required this.alternativas,
  });

  factory Questao.fromMap(Map<String, dynamic> map) {
    return Questao(
      id: map['id'] ?? 0,
      pergunta: map['pergunta'] ?? '',
      gabarito: map['gabarito'] ?? 0,
      alternativas: map['alternativas']
              .map<Alternativa>((map) => Alternativa.fromMap(map))
              .toList() ??
          <Alternativa>[],
    );
  }
}
