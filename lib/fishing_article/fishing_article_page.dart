import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishing_article/fishing_article/fishing_article_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/fishing.dart';

class FishingArticlePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FishingArticleModel>(
      create: (_) => FishingArticleModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("釣果一覧"),
        ),
        body: Center(
          child:Consumer<FishingArticleModel>(builder: (context, model, child) {
            final List<Fishing>? fishings = model.articles;
            if (fishings == null){
              return CircularProgressIndicator();
            }
            final List<Widget> widgets = fishings.map(
                    (article) => ListTile(
                      title: Text(article.title),
                      subtitle: Text(article.type),
                    ),).toList();
            return ListView(
              children: widgets,
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}