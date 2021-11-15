import 'package:json_annotation/json_annotation.dart';

part 'voto.g.dart';

@JsonSerializable()
class Voto {
  String? tItuloEleitor;
  int? numero;

  Voto({this.tItuloEleitor, this.numero});

  factory Voto.fromJson(Map<String, dynamic> json) => _$VotoFromJson(json);
  Map<String, dynamic> toJson() => _$VotoToJson(this);
}
