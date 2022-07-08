import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../domain/fishing.dart';

class FishingArticleModel extends ChangeNotifier{
  final _userCollection = FirebaseFirestore.instance
      .collection('articles');

  List<Fishing>? articles;

  void fetchFishingArticle() async {
    final QuerySnapshot snapshot = await _userCollection.get();
    final List<Fishing> articles = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String title = data['title'];
      final String type = data['type'];
      return Fishing(title, type);
    }).toList();
    this.articles = articles;
    notifyListeners();
  }
}