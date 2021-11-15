import 'package:json_annotation/json_annotation.dart';

part 'candidato.g.dart';

@JsonSerializable()
class Candidato {
  String? nome;
  int? numero;
  String? partido;
  int? cargo;

  Candidato({
    this.nome,
    this.numero,
    this.partido,
    this.cargo,
  });

  factory Candidato.fromJson(Map<String, dynamic> json) =>
      _$CandidatoFromJson(json);
  Map<String, dynamic> toJson() => _$CandidatoToJson(this);
}
