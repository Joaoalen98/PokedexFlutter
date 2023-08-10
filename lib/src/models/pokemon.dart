import 'package:json_annotation/json_annotation.dart';
part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  late int id;
  late String name;
  @JsonKey(name: 'base_experience')
  late int baseExperience;
  late int height;
  late Sprites sprites;
  late List<Types> types;

  Pokemon();

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'back_default')
  late String backDefault;
  @JsonKey(name: 'front_default')
  late String frontDefault;

  Sprites();

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

@JsonSerializable()
class Types {
  late int slot;
  late PkmType type;

  Types();

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}

@JsonSerializable()
class PkmType {
  late String name;
  late String url;

  PkmType();

  factory PkmType.fromJson(Map<String, dynamic> json) =>
      _$PkmTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PkmTypeToJson(this);
}
