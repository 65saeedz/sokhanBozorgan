import 'package:http/http.dart' as http;
import 'package:sokhan_bozorgan/model/sohkanmodel/sohkanmodel.dart';
import 'dart:convert' as convert;

class Repository {
  var url = Uri.parse('https://api.quotable.io/random');
  String qout = '';
  Future<Sohkanmodel> getNewSokhan() async {
    var response = await http.get(url);
    // var jsonResponse = response.body;
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    Sohkanmodel sohkanmodel = Sohkanmodel.fromJson(jsonResponse);
    print(jsonResponse);
    print(sohkanmodel);
    qout = sohkanmodel.content!;
    return sohkanmodel;
  }
}
