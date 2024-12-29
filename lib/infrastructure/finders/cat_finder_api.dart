import 'dart:convert';

import 'package:cats/core/app_config/app_config.dart';
import 'package:cats/domain/entities/cat_breed.dart';
import 'package:cats/domain/interfaces/cat_finder.dart';
import 'package:http/http.dart' as http;

class CatFinderApi extends CatFinder {
  CatFinderApi() {
    _catApiUrl = AppConfig.breedsUrl;
    //_catApiKey = AppConfig.apiKey;
  }

  late final String _catApiUrl;
  late final String _catApiKey;

  @override
  Future<List<CatBreed>> getBreeds(int page, int? limit) async {
    final header = {
      "Content-Type": "application/json",
      'x-api-key': _catApiKey
    };

    final response = await http.get(
      Uri.parse('$_catApiUrl?limit=$limit&page=$page'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return List.from(result.map((x) => CatBreed.fromJson(x)));
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Future<List<CatBreed>> getSearchBreeds(String query) async {
    final header = {
      "Content-Type": "application/json",
      'x-api-key': _catApiKey
    };

    final response = await http.get(
      Uri.parse('$_catApiUrl/search?q=$query'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return List.from(result.map((x) => CatBreed.fromJson(x)));
    } else {
      throw Exception('Failed');
    }
  }
}
