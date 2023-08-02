import 'package:flutter/material.dart';

import 'all_news.dart';
import 'breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter News App"),
            bottom: const TabBar(tabs: [
              Tab(
                text: "Breaking",
              ),
              Tab(
                text: "all news",
              )
            ]),
          ),
          body: const TabBarView(children: [
            BreakingNews(),
            AllNews(),
          ]),
        ));
  }
}
