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
}
