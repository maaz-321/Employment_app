import 'package:employinformationapp/screen/modelfromjason.dart';

import 'package:http/http.dart' as http;

fetch() async {
  var res = await http.get(Uri.parse("https://dummyjson.com/users"));
  try {
    if (res.statusCode == 200) {
      var data = usermodelFromJson(res.body);
      return data.users;
    } else {
      print("Error occur");
    }
  } catch (e) {
    print(e.toString());
  }
}
