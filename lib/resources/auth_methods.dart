import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthMethods {
  late String _token;
  Map<String, dynamic> responseData = {};
  Map<String, dynamic> customerData = {};

  String get token => _token; 

  Future<Map<String, dynamic>> getToken(
      {required String userName, required String password}) async {
    try {
      print("login pressed from auth");
      final String url = "";      
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
        final userId =
            responseData['customerUser']['customer']['customerUserId'];
        _token = responseData['token'];
        print("the token");
        print(_token);
        print(userId);

        return {'userId': userId, 'token': _token};
      } else {
        print('Error getting the token Status code: ${response.statusCode}');
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
      final tokenResult =
          await getToken(userName: userName, password: password);
      print("token result");
      print(tokenResult);

      if (tokenResult.containsKey('error')) {
        print('Login failed after token');
        return 'error';
      } else {
        final userId = tokenResult['userId'];
        final token = tokenResult['token'];

        final customerDataResult =
            await getCustomerData(userId: userId, token: token);

        if (customerDataResult.containsKey('error')) {
          print('Error fetching customer data');
          return 'error';
        } else {
          final customerData = customerDataResult;
          print('Customer data fetched successfully');
          print(customerData);

          return 'success';
        }
      }
    } catch (e) {
      return 'error';
    }
  }

  Future<Map<String, dynamic>> getCustomerData(
      {required String userId, required String token}) async {
    try {
      final String customerUrl = "";
      final customerResponse = await http.get(Uri.parse(customerUrl));

      if (customerResponse.statusCode == 200) {
        final customerData = json.decode(customerResponse.body);
        return customerData;
      } else {
        print(
            'Error fetching customer data. Status code: ${customerResponse.statusCode}');
        return {'error': 'Error fetching customer data'};
      }
    } catch (e) {
      print('Exception during customer data fetch: $e');
      return {'error': 'Exception during customer data fetch'};
    }
  }
}
