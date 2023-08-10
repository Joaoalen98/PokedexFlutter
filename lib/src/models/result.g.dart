// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultList _$ResultListFromJson(Map<String, dynamic> json) => ResultList()
  ..count = json['count'] as int
  ..next = json['next'] as String?
  ..previous = json['previous'] as String?
  ..results = (json['results'] as List<dynamic>)
      .map((e) => Result.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ResultListToJson(ResultList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result()
  ..name = json['name'] as String
  ..url = json['url'] as String;

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
