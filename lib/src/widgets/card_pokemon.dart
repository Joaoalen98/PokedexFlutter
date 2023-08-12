import 'package:flutter/material.dart';
import 'package:pokedex/src/services/color_service.dart';
import 'package:pokedex/src/widgets/detalhes_pokemon.dart';

import '../models/poke_api/pokemon.dart';
import 'card_tipo_pokemon.dart';

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
                backgroundCard?.withOpacity(0.2),
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
                            (tipo) => CardTipoPokemon(
                              backgroundCard: backgroundCard,
                              tipo: tipo.type!.name!,
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
