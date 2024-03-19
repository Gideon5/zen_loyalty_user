import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthMethods {

  Map<String, dynamic> responseData = {};
  Map<String, dynamic> customerData = {};

  Future<String> loginUser(
      {required String userName, required String password}) async {
    try {
      print("login pressed from auth");
      final String url =
          'https://eloyaltyhttpendpoints.azurewebsites.net/api/validatecustomeruser';
      final Map<String, dynamic> userData = {
        "userName": userName,
        "password": password
      };

      final response =
          await http.post(Uri.parse(url), body: jsonEncode(userData));

      if (response.statusCode == 200) {
        print("res 200 first response");
        responseData = json.decode(response.body);
        print(responseData);
        final userId =
            responseData['customerUser']['customer']['customerUserId'];
        final String token = responseData['token'];

        final String customerUrl =
            'https://eloyaltyhttpendpoints.azurewebsites.net/api/GetCustomerUser?id=$userId&code=$token';
        final customerResponse = await http.get(Uri.parse(customerUrl));

        if (customerResponse.statusCode == 200) {
          print('logged from auth method in');
          customerData = json.decode(customerResponse.body);
          print(customerData);
        } else {
          print(
              'Error fetching customer data. Status code: ${customerResponse.statusCode}');
        }
      } else {
        print(
            'Error validating customer user. Status code: ${response.statusCode}');
      }
      return 'success';
    } catch (e) {
      return 'Error';
    }
  }

}
