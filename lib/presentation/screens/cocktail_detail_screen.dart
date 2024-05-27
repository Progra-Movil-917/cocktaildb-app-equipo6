import 'package:cocktaildb_app/domain/entities/drink.dart';
import 'package:cocktaildb_app/infrastructure/datasources/cocktaildb_datasource.dart';
import 'package:cocktaildb_app/infrastructure/repositories/cocktail_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CocktailDetailScreen extends StatefulWidget {
  const CocktailDetailScreen({super.key, required this.cocktailId});
  final String cocktailId;

  @override
  State<CocktailDetailScreen> createState() => _CocktailDetailScreenState();
}

class _CocktailDetailScreenState extends State<CocktailDetailScreen> {
  late Drink _drink;

  final CocktailRepositoryImpl _repositoryImpl =
      CocktailRepositoryImpl(CocktailDBDatasource());

  Future<List<Drink>> _getDrink() async {
    return _repositoryImpl.getDrinkById(widget.cocktailId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Drink Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FutureBuilder(
            future: _getDrink(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasData) {
                _drink = snapshot.data!.first;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Información General',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Divider(),
                  const SizedBox(height: 20),
                  Text(
                    'Nombre de la bebida: ${_drink.name}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Tipo de bebida: ${_drink.alcholic}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Categoría de la bebida: ${_drink.category}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Se bebe en un: ${_drink.glass}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Instrucciones para prepararlo: ${_drink.instructions}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          _drink.imageUrl,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ));
  }
}
