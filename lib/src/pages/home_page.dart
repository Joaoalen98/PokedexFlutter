import 'package:flutter/material.dart';
import 'package:pokedex/src/services/pokeapi_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pokeService = PokeApiService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pókedex Flutter'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Pókemons:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
              FutureBuilder<List<Map<String, dynamic>>>(
                future: pokeService.obterListaPokemons(limit: 20, offset: 30),
                builder: (context, snapshot) {
                  List<Widget> lista = [];

                  if (snapshot.hasData) {
                    lista = snapshot.data!.map(
                      (e) {
                        return Card(
                          child: Row(
                            children: [
                              Image(
                                image: Image.network(
                                  e['sprites']['front_default'],
                                ).image,
                                width: 80,
                              ),
                              Column(
                                children: [
                                  Text(
                                    e['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  ListView.builder(
                                    itemBuilder: (context, index) {
                                      List<Map<String, dynamic>> tipos =
                                          e['types'];
                                      return Row(
                                        children: tipos.map(
                                          (tipo) {
                                            return Text(
                                              tipo['type']['name'],
                                            );
                                          },
                                        ).toList(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList();
                  }

                  return Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: lista,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
