// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon()
  ..id = json['id'] as int
  ..name = json['name'] as String
  ..baseExperience = json['base_experience'] as int
  ..height = json['height'] as int
  ..sprites = Sprites.fromJson(json['sprites'] as Map<String, dynamic>)
  ..types = (json['types'] as List<dynamic>)
      .map((e) => Types.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'sprites': instance.sprites,
      'types': instance.types,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites()
  ..backDefault = json['back_default'] as String
  ..frontDefault = json['front_default'] as String;

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'back_default': instance.backDefault,
      'front_default': instance.frontDefault,
    };

Types _$TypesFromJson(Map<String, dynamic> json) => Types()
  ..slot = json['slot'] as int
  ..type = PkmType.fromJson(json['type'] as Map<String, dynamic>);

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

PkmType _$PkmTypeFromJson(Map<String, dynamic> json) => PkmType()
  ..name = json['name'] as String
  ..url = json['url'] as String;

Map<String, dynamic> _$PkmTypeToJson(PkmType instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
