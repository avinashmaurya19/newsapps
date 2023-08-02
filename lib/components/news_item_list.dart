import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/news_model.dart';
import '../ui/news_details.dart';

class NewsItemList extends StatelessWidget {
  final NewsModel newsModel;
  const NewsItemList({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetails(newsModel: newsModel)));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: newsModel.urlToImage.toString(),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              //errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(newsModel.source!.name.toString()),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(newsModel.publishedAt.toString())
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              newsModel.author == null ? "" : "Written By ${newsModel.author}",
            ),
            const SizedBox(
              height: 8,
            ),
            Text(newsModel.title.toString())
          ],
        ),
      ),
    );
  }
}
