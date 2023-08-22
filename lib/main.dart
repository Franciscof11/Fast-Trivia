import 'package:fast_trivia/controller/repositories/questionario_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  print('alo');
                  final questionarioRepository = QuestionarioRepository();
                  final questionarios =
                      await questionarioRepository.getAllQuestionarios();
                  print('alo fala cmg');
                  for (var quest in questionarios) {
                    print(quest.id);
                    print(quest.questoes);
                    print(quest.titulo);
                  }
                },
                child: const Text('Get all Questionarios'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
