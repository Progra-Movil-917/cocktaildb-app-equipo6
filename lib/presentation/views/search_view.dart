import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              onFieldSubmitted: (value) => print('VALOR ENVIADO: $value'),
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                labelText: 'Buscar un cocktail',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  )
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              children: [
                  ListTile(
                    onTap: (){},
                    title: const Text('Whisky'),
                    subtitle: const Text('Una bebida hecha a base de vino'),
                    leading: Image.network('https://www.singlemalt.ph/cdn/shop/products/Untitleddesign-2021-03-24T165234.115_1024x.png?v=1616575964', height: 120, width: 50,),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  )                
              ],
            ),
          )
        ],
      ),
    );
  }
}