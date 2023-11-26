

import 'package:go_router/go_router.dart';
import 'package:shoes_app/presentation/screens/zapato_desc_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const ShoeDescScreen(),
    )

  ]
  
  
);