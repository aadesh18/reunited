import 'dart:convert';

import 'package:http/http.dart' as http;

class ChatAPI {
  Result? result;

  Future<String?> getData(var query) async {
    String url = "https://helloworld-lyiim2vm7a-ue.a.run.app/chat?input=$query";

    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final parsedJson = jsonDecode(response.body);
      List resultList = parsedJson["result"]["message"];
      if (resultList.length == 1) {
        return resultList[0];
      } else {
        return resultList.join("\n");
      }
    }
    return "Error";
  }
}

class Result {
  List<String>? message;

  Result({this.message});

  Result.fromJson(Map<String, dynamic> json) {
    message = json['message'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    return data;
  }
}


// class ChatAPI {
//   List<String> responseMessage = List.empty(growable: true);
//   Future<String?> getData(var query) async {
//     String url = "https://helloworld-lyiim2vm7a-ue.a.run.app/chat?input=$query";

//     final http.Response response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final parsedJson = jsonDecode(response.body);
      
//       if (parsedJson[0]["result"]["message"]) {
//         return parsedJson["result"]["message"][0];
//       } else {
//         List placesList = parsedJson["result"]["places"];
//         return placesList.join("\n");
//       }
//     }
//     return "Error";
//   }
// }
