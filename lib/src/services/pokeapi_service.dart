import 'dart:convert';

import 'package:http/http.dart' as http;

class PokeApiService {
  final String apiUrl = 'https://pokeapi.co/api/v2';

  Future<List<Map<String, dynamic>>> obterListaPokemons({
    int limit = 20,
    int offset = 30,
  }) async {
    var url = Uri.parse('$apiUrl/pokemon?limit$limit&offset$offset');
    var req = await http.get(url);

    if (req.statusCode == 200) {
      var json = jsonDecode(req.body);

      List<Map<String, dynamic>> listaPokemons = [];

      for (var pok in json['results']) {
        var detalhes = await obterDetalhesPokemon(pok['url']);
        listaPokemons.add(detalhes);
      }

      return listaPokemons;
    } else {
      throw Exception('Erro ao requisitar dados');
    }
  }

  Future<Map<String, dynamic>> obterDetalhesPokemon(String pokemonUrl) async {
    var url = Uri.parse(pokemonUrl);
    var req = await http.get(url);

    if (req.statusCode == 200) {
      var json = jsonDecode(req.body);
      return json;
    } else {
      throw Exception('Erro ao requisitar dados');
    }
  }
}
