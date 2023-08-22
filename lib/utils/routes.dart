import 'package:fast_trivia/view/pages/home_page.dart';
import 'package:go_router/go_router.dart';

import '../view/pages/quiz_page.dart';

final routes = GoRouter(
  initialLocation: '/HomePage',
  routes: [
    GoRoute(
      path: '/HomePage',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/QuizPage',
      builder: (context, state) => QuizPage(
        idQuestionario: state.extra as int,
      ),
    ),
  ],
);
