import 'package:fast_trivia/controller/quiz/quiz_estate.dart';
import 'package:fast_trivia/model/questao.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final quizControllerProvider =
    StateNotifierProvider.autoDispose((ref) => QuizController());

class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState.initial());

  void enviarResposta(Questao questaoAtual, int resposta) {
    if (state.respondido) return;
    if (questaoAtual.gabarito == resposta) {
      state = state.copyWith(
        respostaSelecionada: resposta,
        correta: state.correta..add(questaoAtual),
        status: QuizStatus.correto,
      );
    } else {
      state = state.copyWith(
        respostaSelecionada: resposta,
        incorreta: state.incorreta..add(questaoAtual),
        status: QuizStatus.incorreto,
      );
    }
  }

  void proximaPergunta(List<Questao> questoes, int index) {
    state = state.copyWith(
      respostaSelecionada: 0,
      status: index + 1 < questoes.length
          ? QuizStatus.inicial
          : QuizStatus.finalizado,
    );
  }

  void reset() {
    state = QuizState.initial();
  }
}
