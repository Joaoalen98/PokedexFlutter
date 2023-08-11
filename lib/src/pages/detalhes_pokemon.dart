import 'package:flutter/material.dart';
import 'package:pokedex/src/models/poke_api/pokemon.dart';

class DetalhesPokemon extends StatelessWidget {
  final Pokemon pokemon;
  const DetalhesPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              height: 100,
              color: Theme.of(context).primaryColor,
              child: Image.network(
                pokemon.sprites!.frontDefault!,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              pokemon.name!,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Tipos: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: pokemon.types!.map(
                          (type) {
                            return TextButton(
                              onPressed: () {},
                              child: Text(type.type!.name!),
                            );
                          },
                        ).toList(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Evoluções: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
