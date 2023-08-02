import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/news_model.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key, required this.newsModel});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.newsModel.title.toString(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: widget.newsModel.urlToImage.toString(),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
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
                  child: Text(widget.newsModel.source!.name.toString()),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(widget.newsModel.publishedAt.toString())
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.newsModel.author == null
                  ? ""
                  : "Written By ${widget.newsModel.author}",
            ),
            const SizedBox(
              height: 8,
            ),
            Text(widget.newsModel.title.toString()),
            const SizedBox(
              height: 8,
            ),
            Text(widget.newsModel.description.toString()),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () async {
                  final Uri uri = Uri.parse(widget.newsModel.url.toString());
                  if (await launchUrl(uri)) {
                    //throw Exception("could not launch");
                  }
                },
                child: const Text("Read More..."))
          ],
        ),
      ),
    );
  }
}
