import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';

@JsonSerializable()
class ResultList {
  late int count;
  String? next;
  String? previous;
  late List<Result> results;

  ResultList();

  factory ResultList.fromJson(Map<String, dynamic> json) =>
      _$ResultListFromJson(json);

  Map<String, dynamic> toJson() => _$ResultListToJson(this);
}

@JsonSerializable()
class Result {
  late String name;
  late String url;

  Result();

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
