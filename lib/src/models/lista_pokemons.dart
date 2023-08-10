import 'package:pokedex/src/models/pokemon.dart';

class ListaPokemons {
  String? next;
  String? previous;
  List<Pokemon> pokemons;

  ListaPokemons({
    required this.next,
    required this.previous,
    required this.pokemons,
  });
}
