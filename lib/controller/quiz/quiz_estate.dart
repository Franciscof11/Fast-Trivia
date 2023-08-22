// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:fast_trivia/model/questao.dart';

enum QuizStatus { inicial, correto, incorreto, finalizado }

class QuizState extends Equatable {
  final QuizStatus status;
  final String respostaSelecionada;
  final List<Questao> correta;
  final List<Questao> incorreta;

  const QuizState({
    required this.status,
    required this.respostaSelecionada,
    required this.correta,
    required this.incorreta,
  });

  bool get respondido =>
      status == QuizStatus.incorreto || status == QuizStatus.correto;

  factory QuizState.initial() {
    return const QuizState(
      status: QuizStatus.inicial,
      respostaSelecionada: '',
      correta: [],
      incorreta: [],
    );
  }

  QuizState copyWith({
    QuizStatus? status,
    String? respostaSelecionada,
    List<Questao>? correta,
    List<Questao>? incorreta,
  }) {
    return QuizState(
      status: status ?? this.status,
      respostaSelecionada: respostaSelecionada ?? this.respostaSelecionada,
      correta: correta ?? this.correta,
      incorreta: incorreta ?? this.incorreta,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
