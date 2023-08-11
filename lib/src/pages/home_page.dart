import 'package:flutter/material.dart';
import 'package:pokedex/src/models/lista_pokemons.dart';
import 'package:pokedex/src/pages/detalhes_pokemon.dart';
import 'package:pokedex/src/services/pokeapi_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pokeService = PokeApiService();
  int pagina = 1;
  ListaPokemons? results;

  void obterPokemons() {
    setState(() {
      results = null;
    });

    pokeService.obterListaPokemons(page: pagina).then((val) {
      setState(() {
        results = val;
      });
    });
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      if (results?.previous != null) {
                        pagina--;
                        obterPokemons();
                      }
                    },
                    child: const Text('Anterior'),
                  ),
                  Text('Página $pagina'),
                  TextButton(
                    onPressed: () {
                      if (results?.next != null) {
                        pagina++;
                        obterPokemons();
                      }
                    },
                    child: const Text('Próximo'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              results != null
                  ? Column(
                      children: results!.pokemons.map(
                      (pokemon) {
                        return Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: Image.network(
                                  pokemon.sprites!.frontDefault!,
                                ).image,
                                width: 80,
                              ),
                              Column(
                                children: [
                                  Text(
                                    pokemon.name!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Row(
                                    children: pokemon.types!
                                        .map(
                                          (tipo) => TextButton(
                                            onPressed: () {},
                                            child: Text(tipo.type!.name!),
                                          ),
                                        )
                                        .toList(),
                                  )
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetalhesPokemon(
                                        pokemon: pokemon,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.search),
                              ),
                            ],
                          ),
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
