import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/src/models/lista_pokemons.dart';
import 'package:pokedex/src/models/poke_api/resource_list.dart';

import '../models/poke_api/pokemon.dart';

class PokeApiService {
  static const String baseUrl = 'https://pokeapi.co/api/v2/pokemon/';
  static String pokemonListBaseUrl = '$baseUrl?offset=0&limit=20';

  Future<ListaPokemons> obterListaPokemons(String url) async {
    var uri = Uri.parse(url);
    var req = await http.get(uri);

    if (req.statusCode == 200) {
      var json = jsonDecode(req.body);
      var results = ResourceList.fromJson(json);

      List<Pokemon> listaPokemons = [];

      for (var pok in results.results!) {
        var detalhes = await obterDetalhesPokemon(pok.url!);
        listaPokemons.add(detalhes);
      }

      return ListaPokemons(
        next: results.next,
        pokemons: listaPokemons,
        previous: results.previous,
      );
    } else {
      throw Exception('Erro ao requisitar dados');
    }
  }

  Future<Pokemon> obterDetalhesPokemon(String pokemonUrl) async {
    var url = Uri.parse(pokemonUrl);
    var req = await http.get(url);

    if (req.statusCode == 200) {
      var json = jsonDecode(req.body);
      return Pokemon.fromJson(json);
    } else {
      throw Exception('Erro ao requisitar dados');
    }
  }
}
