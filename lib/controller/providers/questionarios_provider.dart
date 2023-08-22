import 'package:fast_trivia/model/questao.dart';
import 'package:fast_trivia/model/questionario.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/questionario_repository.dart';

final apiServiceProvider =
    Provider<QuestionarioRepository>((ref) => QuestionarioRepository());

final questionariosProvider = FutureProvider<List<Questionario>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getAllQuestionarios();
});

final questoesProvider = FutureProvider<List<Questao>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getQuestoes(1);
});
