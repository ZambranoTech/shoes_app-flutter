

import 'package:go_router/go_router.dart';
import 'package:shoes_app/presentation/screens/screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const ShoesScreen(),
    ),
    GoRoute(
      path: '/shoe-preview',
      builder: (context, state) => const ShoeDescScreen(),
    )

  ]
  
  
);