import 'package:cocktaildb_app/presentation/screens/cocktail_detail_screen.dart';
import 'package:cocktaildb_app/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen(), routes: [
    GoRoute(
        path: 'drink/:id',
        builder: (context, state) {
          String id = state.pathParameters['id']!;
          return CocktailDetailScreen( cocktailId: id );
        })
  ])
]);
