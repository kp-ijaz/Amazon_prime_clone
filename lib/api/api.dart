import 'dart:convert';
import 'package:amazonprime/api/constants.dart';

import '../models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _nowPlayingUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';
  static const _popularUrl =
      'https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}';
  static const _topRated =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _favourite =
      'https://api.themoviedb.org/3/trending/all/day?api_key=${Constants.apiKey}';
  static const _upcominmovies =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  Future<List<Movie>> getnowPlayingMovies() async {
    final response = await http.get(Uri.parse(_nowPlayingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> gettopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRated));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getFavouriteMovies() async {
    final response = await http.get(Uri.parse(_favourite));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcominmovies));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}
