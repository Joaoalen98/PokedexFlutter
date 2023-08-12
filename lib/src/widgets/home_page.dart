import 'package:flutter/material.dart';
import 'package:pokedex/src/models/lista_pokemons.dart';
import 'package:pokedex/src/services/pokeapi_service.dart';

import 'card_pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pokeService = PokeApiService();
  int pagina = 1;
  ListaPokemons? results;

  void obterPokemons() async {
    setState(() {
      results = null;
    });

    try {
      var req = await pokeService.obterListaPokemons(page: pagina);
      setState(() {
        results = req;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    obterPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pókedex'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Pesquisar pókemon'),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Pesquisar',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Página $pagina'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  results?.previous != null
                      ? TextButton(
                          onPressed: () {
                            if (results?.previous != null) {
                              pagina--;
                              obterPokemons();
                            }
                          },
                          child: const Text('Anterior'),
                        )
                      : Container(),
                  results?.next != null
                      ? TextButton(
                          onPressed: () {
                            if (results?.next != null) {
                              pagina++;
                              obterPokemons();
                            }
                          },
                          child: const Text('Próximo'),
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              results != null
                  ? Column(
                      children: results!.pokemons.map(
                      (pokemon) {
                        return Column(
                          children: [
                            CardPokemon(
                              pokemon: pokemon,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        );
                      },
                    ).toList())
                  : const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
