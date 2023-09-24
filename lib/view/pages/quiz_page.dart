import 'package:fast_trivia/view/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
      data: (data) => Scaffold(
        backgroundColor: Colors.yellow[700],
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 110),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(45),
                      topEnd: Radius.circular(45),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 108),
                  Text(
                    '1 / 5',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 140),
              child: Column(
                children: [
                  Text(
                    data.first.pergunta,
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      wordSpacing: 6,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButtom(
                    title: data.first.alternativas[0].titulo,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtom(
                    title: data.first.alternativas[1].titulo,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtom(
                    title: data.first.alternativas[2].titulo,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtom(
                    title: data.first.alternativas[3].titulo,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
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
