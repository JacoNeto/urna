// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidato.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Candidato _$CandidatoFromJson(Map<String, dynamic> json) => Candidato(
      nome: json['nome'] as String?,
      numero: json['numero'] as int?,
      partido: json['partido'] as String?,
      cargo: json['cargo'] as int?,
      imagem: json['imagem'] as String?,
    );

Map<String, dynamic> _$CandidatoToJson(Candidato instance) => <String, dynamic>{
      'nome': instance.nome,
      'numero': instance.numero,
      'partido': instance.partido,
      'cargo': instance.cargo,
      'imagem': instance.imagem,
    };
