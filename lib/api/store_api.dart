import 'dart:convert';

import 'package:amazonprime/api/constants.dart';
import 'package:amazonprime/models/store_model.dart';
import 'package:http/http.dart' as http;

class StoreApi {
  static const _popularStoreurl =
      'https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}';
  static const _topRatedStoreurl =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apiKey}';
  static const _spotlightStore =
      'https://api.themoviedb.org/3/tv/on_the_air?api_key=${Constants.apiKey}';
  static const _subscriptionStore =
      'https://api.themoviedb.org/3/tv/latest?api_key=${Constants.apiKey}';

  Future<List<Store>> getPoplarStore() async {
    final response = await http.get(Uri.parse(_popularStoreurl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Store.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Store>> getTopRatedStore() async {
    final response = await http.get(Uri.parse(_topRatedStoreurl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Store.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Store>> getSpotlightStore() async {
    final response = await http.get(Uri.parse(_spotlightStore));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Store.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Store>> getSubscriptionStore() async {
    final response = await http.get(Uri.parse(_subscriptionStore));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Store.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}
