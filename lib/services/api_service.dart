import 'dart:convert';
import 'package:shop_app/models/vehicle_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<VehicleModel> fetchVehicles() async {
    final response = await http.get(
      Uri.parse('https://wantapi.com/vehicles.php'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      return VehicleModel.fromJson(jsonData);
    } else {
      throw Exception("An error occurred.");
    }
  }
}
