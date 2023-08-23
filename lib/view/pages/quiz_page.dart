import 'package:fast_trivia/view/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controller/providers/questionarios_provider.dart';

class QuizPage extends ConsumerWidget {
  final int idQuestionario;
  const QuizPage({
    super.key,
    required this.idQuestionario,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questoes = ref.watch(questoesProvider(idQuestionario));

    return questoes.when(
      data: (data) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow[600]!,
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.first.pergunta),
                SizedBox(
                  height: 20,
                ),
                CustomButtom(
                    title: data.first.alternativas.first.titulo,
                    onTap: () {
                      context.pop();
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomButtom(
                    title: data.first.alternativas[1].titulo,
                    onTap: () {
                      context.pop();
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomButtom(
                    title: data.first.alternativas[2].titulo,
                    onTap: () {
                      context.pop();
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomButtom(
                    title: data.first.alternativas[3].titulo,
                    onTap: () {
                      context.pop();
                    }),
              ],
            ),
          ),
        ),
      ),
      error: (error, _) => Center(
        child: Text('$error'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
