import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Existing method to fetch data from the placeholder API
  Future<List<Map<String, dynamic>>> fetchRestaurantsFromPlaceholder() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> rawData = jsonDecode(response.body);

      final List<Map<String, dynamic>> restaurants = rawData.map((data) {
        return {
          'name': data['title'],
          'rating': data['userId'].toDouble(),
        };
      }).toList();

      return restaurants;
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  // New method to provide hardcoded restaurant data
  Future<List<Map<String, dynamic>>> fetchHardcodedRestaurants() async {
    return [
      {'name': 'Tasty Bites', 'rating': 4.5},
      {'name': 'Spice Haven', 'rating': 4.2},
      {'name': 'Delightful Eats', 'rating': 4.8},
      {'name': 'Savory Delights', 'rating': 3.9},
      {'name': 'Flavorsome Fusion', 'rating': 4.1},
      {'name': 'Urban Grill', 'rating': 4.6},
      {'name': 'Munchie Mansion', 'rating': 3.7},
      {'name': 'Culinary Corner', 'rating': 4.3},
      {'name': 'Gourmet Gateway', 'rating': 4.9},
      {'name': 'Zesty Zing', 'rating': 4.0},
      {'name': 'Sizzling Sips', 'rating': 3.5},
      {'name': 'Aromatic Bites', 'rating': 4.4},
      {'name': 'Taste Temptation', 'rating': 4.7},
      {'name': 'Yummy Junction', 'rating': 4.2},
      {'name': 'Flourish Flavors', 'rating': 4.6},
    ];
  }
}
