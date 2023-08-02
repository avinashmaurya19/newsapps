import 'package:flutter/material.dart';
import 'package:newsapps/model/news_model.dart';

import '../components/news_item_list.dart';
import '../service/api_service.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getBreakingNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articlesList = snapshot.data ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItemList(
                  newsModel: articlesList[index],
                );
              },
              itemCount: articlesList.length,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
