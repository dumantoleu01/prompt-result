import 'package:go_router/go_router.dart';
import '../../presentation/pages/prompt_page.dart';
import '../../presentation/pages/result_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const PromptPage()),
      GoRoute(path: '/result', builder: (context, state) => const ResultPage()),
    ],
  );
}
