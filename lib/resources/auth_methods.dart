import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AuthMethods {
  Map<String, dynamic> responseData = {};
  Map<String, dynamic> customerData = {};
  late String _token;




    String get token => _token; // Getter for the token


  Future<Map<String, dynamic>> getToken(
      {required String userName, required String password}) async {
    try {
      print("login pressed from auth");
      final String url =
          'https://eloyaltyhttpendpoints.azurewebsites.net/api/validatecustomeruser';
      final Map<String, dynamic> userData = {
        "userName": userName,
        "password": password
      };
      Map<String, dynamic> responseData = {};

      final response =
          await http.post(Uri.parse(url), body: jsonEncode(userData));

      if (response.statusCode == 200) {
        print("i have the token");
        responseData = json.decode(response.body);
        print(responseData);
        final userId = responseData['customerUser']['customer']['customerUserId'];
        _token = responseData['token'];
          print("the token");
        print(_token);
        print(userId);
      
        return {'userId': userId, 'token': _token};
      } else {
        print(
            'Error getting the token Status code: ${response.statusCode}');
        return {'error': 'from gettoken Error'};
      }
    } catch (e) {
      print(e);
      return {'error': 'catch from gettoken Error'};
    }
  }

  Future<String> loginUser(
      {required String userName, required String password}) async {
    try {
      final authMethods = AuthMethods();
      final tokenResult =
          await authMethods.getToken(userName: userName, password: password);
          print("token result");
          print(tokenResult);

      if (tokenResult.containsKey('error')) {
        print('Login failed after token');
        return 'error';
      } else {
        final userId = tokenResult['userId'];
        final token = tokenResult['token'];

        final String customerUrl =
            'https://eloyaltyhttpendpoints.azurewebsites.net/api/GetCustomerUser?id=$userId&code=$token';
        final customerResponse = await http.get(Uri.parse(customerUrl));

        if (customerResponse.statusCode == 200) {
          print('logged from with auth method in');

          final customerData = json.decode(customerResponse.body);
          print(customerData);

          return 'success';
        } else {
          print(
              'Error fetching with token customer data. Status code: ${customerResponse.statusCode}');
          return 'error';
        }
      }
    } catch (e) {
      return 'error';
    }
  }
}
