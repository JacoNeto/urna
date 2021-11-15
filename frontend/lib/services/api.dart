import 'package:urna/models/candidato/candidato.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:urna/models/voto/voto.dart';

const baseUrl = "http://localhost:5000";

class API {
  //
  // get candidatos List by role
  // and transforms the json in a QuestAutodiag list
  static Future<List<Candidato>> fetchQuestsAutodiag(int cargo) async {
    var url = Uri.parse(baseUrl + "/api/cadidato?cargo=$cargo");
    http.Response response = await http.get(url);
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

    final questAutodiagList =
        parsed.map<Candidato>((json) => Candidato.fromJson(json)).toList();

    return questAutodiagList;
  }

  //
  // search candidato by numero
  static Future<Candidato>? fetchCandidatoByNumero(int numero) async {
    var url = Uri.parse(baseUrl + "/$numero");
    http.Response response = await http.get(url);
    final parsed = jsonDecode(response.body).cast<String, dynamic>();

    final candidato = Candidato.fromJson(parsed);
    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print("chegou aqui");
    } else {
      print("nao chegou aqui");
    }

    return candidato;
  }

  //
  // send voto to API
  static Future<http.Response> vote(Voto voto) async {
    print(voto.toJson());
    print(jsonEncode(voto.toJson()));
    final http.Response response = await http.post(
      Uri.parse(baseUrl + '/api/Voto'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(voto.toJson()),
    );
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print("chegou aqui");
    } else {
      print("nao chegou aqui");
    }
    return response;
  }
}
