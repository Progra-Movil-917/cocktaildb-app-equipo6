import 'package:cocktaildb_app/domain/entities/drink.dart';
import 'package:cocktaildb_app/infrastructure/datasources/cocktaildb_datasource.dart';
import 'package:cocktaildb_app/infrastructure/repositories/cocktail_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Drink> _drinks = [];
  final CocktailRepositoryImpl _repositoryImpl =
      CocktailRepositoryImpl(CocktailDBDatasource());

  Future<List<Drink>> _getRandomCocktails() async {
    List<Drink> randomCocktailsGetted = [];

    for (int i = 0; i < 13; i++) {
      final drink = await _repositoryImpl.getRandomDrinks();
      randomCocktailsGetted.add(drink[0]);
    }

    return randomCocktailsGetted;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: _getRandomCocktails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            _drinks = snapshot.data!;
          }

          return ListView.builder(
            itemCount: _drinks.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(10.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: (){
                    context.go('/drink/${_drinks[index].drinkId}');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        _drinks[index].imageUrl,
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _drinks[index].name,
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              _drinks[index].category,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
