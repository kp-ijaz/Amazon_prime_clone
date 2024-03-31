import 'dart:convert';
import 'dart:developer';

import 'package:amazonprime/models/searchrespo/searchrespo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

class SearchApi {
  SearchApi.internal();
  static SearchApi instance = SearchApi.internal();
  factory SearchApi() => instance;

  ValueNotifier<List<SearchResultData>> searchResultListNotifier =
      ValueNotifier([]);

  Future<void> searchMovies(String keyword) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/multi?query=$keyword&include_adult=false&language=en-US&page=1&api_key=${Constants.apiKey}'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'] as List;
      List<SearchResultData> results =
          data.map((e) => SearchResultData.fromJson(e)).toList();

      searchResultListNotifier.value = results;
      searchResultListNotifier.notifyListeners();
    } else {
      log('Failed to load search results');
    }
  }
}
