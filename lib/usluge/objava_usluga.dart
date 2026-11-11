import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modeli/objava.dart';

class ObjavaUsluga {
  static const String _url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Objava>> dohvatiObjave() async {
    final odgovor = await http
        .get(Uri.parse(_url))
        .timeout(const Duration(seconds: 10));

    if (odgovor.statusCode != 200) {
      throw Exception('Poslužitelj trenutačno nije dostupan.');
    }

    final podaci = jsonDecode(odgovor.body);

    if (podaci is! List) {
      throw const FormatException('Neispravan format podataka.');
    }

    return podaci
        .map((zapis) => Objava.fromJson(zapis as Map<String, dynamic>))
        .toList();
  }
}
