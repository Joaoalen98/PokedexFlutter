import 'package:flutter/material.dart';
import 'package:pokedex/src/models/poke_api/pokemon.dart';
import 'package:pokedex/src/services/color_service.dart';
import 'package:pokedex/src/widgets/card_tipo_pokemon.dart';

class DetalhesPokemon extends StatefulWidget {
  final Pokemon pokemon;

  const DetalhesPokemon({super.key, required this.pokemon});

  @override
  State<DetalhesPokemon> createState() => _DetalhesPokemonState();
}

class _DetalhesPokemonState extends State<DetalhesPokemon> {
  final colorService = ColorService();
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();

    colorService
        .getDominantColor(
          widget.pokemon.sprites!.frontDefault!,
        )
        .then(
          (color) => {setState(() => backgroundColor = color)},
        );
  }

  @override
  Widget build(BuildContext context) {
    return backgroundColor != null
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: backgroundColor?.withOpacity(0.3),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    width: double.infinity,
                    height: 100,
                    color: backgroundColor?.withOpacity(0.3),
                    child: Image.network(
                      widget.pokemon.sprites!.frontDefault!,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.pokemon.name!,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: widget.pokemon.types!.map(
                            (type) {
                              return CardTipoPokemon(
                                backgroundCard: backgroundColor,
                                tipo: type.type!.name!,
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : const Scaffold();
  }
}
