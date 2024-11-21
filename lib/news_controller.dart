import 'package:get/get.dart';
import 'package:news_app/services/news_service.dart';
import 'models/news_model.dart';

class NewsController extends GetxController{
  var newsList = <Articles>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final NewsService _newsService = NewsService();

  void fetchNews(String category) async{
    isLoading(true);
    try{
      final newsData = await _newsService.fetchNews(category);
      newsList.value = newsData.articles ?? [];
    }
    catch(e){
      errorMessage.value = "Error:$e";
    }
    finally{
      isLoading(false);
    }
  }
}