import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class NewsDetailPage extends StatelessWidget {
  final Articles article;

  NewsDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title ?? "News Detail",
          style: const TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null)
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage!),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey,
                child: const Center(child: Text("No Image Available")),
              ),
            const SizedBox(height: 16),
            // Article title
            Text(
              article.title ?? "No Title",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Author and date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.author ?? "Unknown Author",
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  article.publishedAt?.substring(0, 10) ?? "Unknown Date",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Article content
            Text(
              article.content ?? "No Content Available",
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            // Visit article link
            if (article.url != null)
              Center(
                child: ElevatedButton(
                  onPressed: () {

                  },
                  child: const Text("Read Full Article"),
                ),
              ),
          ],
        ),
      ),
      backgroundColor: const Color(0xffD4EEF0),
    );
  }
}
