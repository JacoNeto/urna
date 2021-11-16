//import 'package:json_annotation/json_annotation.dart';

part 'candidato.g.dart';

//@JsonSerializable()
class Candidato {
  String? nome;
  int? numero;
  String? partido;
  int? cargo;
  int? votos;
  String? id;
  String? imagem;

  Candidato(
      {this.nome,
      this.numero,
      this.partido,
      this.cargo,
      this.votos,
      this.id,
      this.imagem});

  factory Candidato.fromJson(Map<String, dynamic> json) =>
      _$CandidatoFromJson(json);
  Map<String, dynamic> toJson() => _$CandidatoToJson(this);
}
