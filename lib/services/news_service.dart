import 'package:news_app/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class NewsService{
  final String _apiKey = "cddf4409857e4780a04d8986aaa2d042";
  final String _baseUrl = "https://newsapi.org/v2/";

  Future<NewsModel>fetchNews(String category) async{
    final url = Uri.parse("$_baseUrl/everything?q=$category&from=2024-10-21&sortBy=publishedAt&apiKey=$_apiKey");
    final response = await http.get(url);

    if(response.statusCode == 200){
      final jsonData = jsonDecode(response.body);
      return NewsModel.fromJson(jsonData);
    }
    else{
      throw Exception("Failed to load news");
    }
  }

}