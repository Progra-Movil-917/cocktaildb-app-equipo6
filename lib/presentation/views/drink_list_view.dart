import 'dart:math';

import 'package:cocktaildb_app/domain/entities/drink.dart';
import 'package:cocktaildb_app/infrastructure/datasources/cocktaildb_datasource.dart';
import 'package:cocktaildb_app/infrastructure/repositories/cocktail_repository_impl.dart';
import 'package:flutter/material.dart';

class DrinkListView extends StatefulWidget {
  const DrinkListView({super.key});

  @override
  State<DrinkListView> createState() => _DrinkListViewState();
}

class _DrinkListViewState extends State<DrinkListView> {
  List<Drink> _drinks = [];
  String _firstLetter = 'a';
  final CocktailRepositoryImpl _repositoryImpl =
      CocktailRepositoryImpl(CocktailDBDatasource());

  Future<List<Drink>> _getDrinks(String letter) async {
    return _repositoryImpl.getDrinksByFirstLetter(letter);
  }

  @override
  void initState() {
    super.initState();

    Random random = Random();
    int r = random.nextInt(26); 
    String caracterRandom = String.fromCharCode(
        r + 'a'.codeUnitAt(0));
    _firstLetter = caracterRandom;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: _getDrinks(_firstLetter),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            _drinks = snapshot.data!;
          }

          return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: _drinks.length,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () {},
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(_drinks[index].imageUrl,
                            width: 50, height: 50)),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    title: Text(_drinks[index].name),
                    subtitle: Text(_drinks[index].category));
              });
        },
      ),
    );
  }
}
