import 'package:json_annotation/json_annotation.dart';

part 'candidato.g.dart';

@JsonSerializable()
class Candidato {
  String? nome;
  int? numero;
  String? partido;
  int? cargo;
  String? imagem;

  Candidato({this.nome, this.numero, this.partido, this.cargo, this.imagem});

  factory Candidato.fromJson(Map<String, dynamic> json) =>
      _$CandidatoFromJson(json);
  Map<String, dynamic> toJson() => _$CandidatoToJson(this);
}
