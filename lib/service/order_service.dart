import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:training_app/constants/default.dart';
import 'package:training_app/model/api_response_model.dart';

Future<APIResponseModel> getOrders() async {
  //String token = await SharedPrefs.getToken();

  String token = "GAHAJAJJAJJ";

  const String api_url = "$API_URL/orders";

  print("Make get orders");

  try {
    final response = await http.get("$api_url", headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json"
    });

    print("response get orders");

    //print(response.body);

    //APIResponseModel apiResponse = APIResponseModel.fromJson(json.decode(response.body));

    Map<String, dynamic> body = json.decode(response.body);

    APIResponseModel apiResponse = APIResponseModel(
        code: "",
        status: response.statusCode,
        data: body["data"],
        message: "Sucesso");

    apiResponse.headers = response.headers;

    print("apiResponse.headers");

    //print(apiResponse.headers);

    return apiResponse;
  } catch (e) {
    print("Error getting orders");
    print(e);
    return APIResponseModel.onException();
  }
}

Future<APIResponseModel> orderDetail(number) async {
  String apiUrl = "$API_URL/orders/$number";

  //String token = await SharedPrefs.getToken();

  String token = "GAHAJAJJAJJ";
  try {
    print("Make get order");

    final response = await http.get("$apiUrl", headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json"
    });

    // print("response get orders");
    //print(response.body);

    var apiResponse = APIResponseModel.fromJson(json.decode(response.body));
    apiResponse.headers = response.headers;

    //print("apiResponse.headers");
    //print(apiResponse.headers);

    return apiResponse;
  } catch (e) {
    print("Error getting order");
    print(e);
    return APIResponseModel.onException();
  }
}
