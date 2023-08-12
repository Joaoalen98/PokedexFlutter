import 'package:flutter/material.dart';
import 'package:pokedex/src/services/color_service.dart';
import 'package:pokedex/src/widgets/detalhes_pokemon.dart';

import '../models/poke_api/pokemon.dart';

class CardPokemon extends StatefulWidget {
  final Pokemon pokemon;

  const CardPokemon({
    super.key,
    required this.pokemon,
  });

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  final colorService = ColorService();
  Color? backgroundCard;

  @override
  void initState() {
    super.initState();

    colorService
        .getDominantColor(
          widget.pokemon.sprites!.frontDefault!,
        )
        .then(
          (color) => {setState(() => backgroundCard = color)},
        );
  }

  @override
  Widget build(BuildContext context) {
    return backgroundCard != null
        ? TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                backgroundCard?.withOpacity(0.3),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetalhesPokemon(pokemon: widget.pokemon),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      widget.pokemon.name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: widget.pokemon.types!
                          .map(
                            (tipo) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: backgroundCard?.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Text(
                                tipo.type!.name!,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
                Image(
                  image: Image.network(
                    widget.pokemon.sprites!.frontDefault!,
                  ).image,
                  width: 80,
                ),
              ],
            ),
          )
        : Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          );
  }
}
