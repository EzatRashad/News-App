 
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:news_app/models/NewsModel.dart';
import 'package:news_app/models/source_model.dart';
import '../core/constants.dart';

class ApiService {
    Future<SourceModel> getSources(String categoryId) async {
    Dio dio = Dio();
    String url = Uri.https(Constants.baseUrl, Constants.sourcesEndPoint, {
      'apiKey': Constants.apiKey,
      'language': 'en',
      'category':categoryId
    }).toString();

    try {
      var response = await dio.get(url);
      
      if (response.statusCode != 200) {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }

      var json = response.data;
      return SourceModel.fromJson(json);
    } catch (e) {
      log('Error-----: $e');
      throw Exception('Error fetching data: $e');
    }
  }


   Future<NewsModel> getNewsBySourceId(String sourceId ) async {
    Dio dio = Dio();
    String url = Uri.https(Constants.baseUrl, Constants.articlesEndPoint, {
      'apiKey': Constants.apiKey,
      'sources': sourceId,
    }).toString();

    try {
      var response = await dio.get(url);
      
      if (response.statusCode != 200) {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }

      var json = response.data;
      return NewsModel.fromJson(json);
    } catch (e) {
      log('Error-----: $e');
      throw Exception('Error fetching data: $e');
    }
  } 

  static Future<NewsModel> search(String text ) async {
    Dio dio = Dio();
    String url = Uri.https(Constants.baseUrl, Constants.articlesEndPoint, {
      'apiKey': Constants.apiKey,
      'q': text,
    }).toString();

    try {
      var response = await dio.get(url);
      
      if (response.statusCode != 200) {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }

      var json = response.data;
      return NewsModel.fromJson(json);
    } catch (e) {
      log('Error-----: $e');
      throw Exception('Error fetching data: $e');
    }
  }
}
