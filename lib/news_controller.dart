import 'package:get/get.dart';
import 'package:news_app/services/news_service.dart';
import 'models/news_model.dart';

class NewsController extends GetxController{
  var newsList = <Article>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final NewsService _newsService = NewsService();

  Future<void> fetchNews(String category) async {
    isLoading.value = true;
    try {
      final news = await _newsService.fetchNews(category);
      newsList.assignAll(news.articles);
      errorMessage.value = '';
    } catch (error) {
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }
}