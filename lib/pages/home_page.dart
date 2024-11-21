import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/app_strings.dart';
import 'package:news_app/news_controller.dart';

class HomePage extends StatelessWidget {
  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    _newsController.fetchNews(AppStrings.techTitle);

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            AppStrings.appTitle,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.hotNewsTitle,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  AppStrings.seeAllTitle,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (_newsController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (_newsController.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text(
                      _newsController.errorMessage.value,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (_newsController.newsList.isEmpty) {
                  return const Center(
                    child: Text(
                      AppStrings.noNews,
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: _newsController.newsList.length,
                  itemBuilder: (context, index) {
                    final article = _newsController.newsList[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to a detail page
                        // Get.to(() => NewsDetailPage(article: article));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xffD4EEF0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    article.urlToImage ??
                                        "https://via.placeholder.com/150",
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Text(AppStrings.imageNotAvail),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 5.0,
                              ),
                              child: Text(
                                article.title ?? AppStrings.noTitle,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 5.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(article.author ?? AppStrings.unknownAuthor),
                                  Text(
                                    article.publishedAt?.substring(0, 10) ??
                                        AppStrings.unknownDate,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

