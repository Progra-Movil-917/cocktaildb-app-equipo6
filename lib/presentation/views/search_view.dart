import 'package:cocktaildb_app/domain/entities/drink.dart';
import 'package:cocktaildb_app/infrastructure/datasources/cocktaildb_datasource.dart';
import 'package:cocktaildb_app/infrastructure/repositories/cocktail_repository_impl.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Drink> _drinks = [];
  final CocktailRepositoryImpl _repositoryImpl =
      CocktailRepositoryImpl(CocktailDBDatasource());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              onChanged: (value) async {
                final drinks = await _repositoryImpl.getDrinksByName(value);
                setState(() {
                  _drinks = drinks;
                });
              },
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                labelText: 'Buscar un cocktail',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: _drinks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  title: Text(_drinks[index].name),
                  subtitle: Text(_drinks[index].alcholic),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        _drinks[index].imageUrl,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
