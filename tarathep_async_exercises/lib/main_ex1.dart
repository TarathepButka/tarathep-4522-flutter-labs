import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchPublicIP() async {
  try {
    final response =
        await http.get(Uri.parse('https://api.ipify.org?format=json'));
    if (response.statusCode == 200) {
      final ip = jsonDecode(response.body)['ip'];
      return ip;
    } else {
      return 'Failed to get public IP';
    }
  } catch (e) {
    return 'Failed to get public IP';
  }
}

void main() {
  fetchPublicIP().then((ip) {
    print('Your public IP address is: $ip');
  }).catchError((error) {
    print('Error: $error');
  });
}
