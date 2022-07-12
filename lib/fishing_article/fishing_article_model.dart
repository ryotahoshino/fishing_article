import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishing_article/domain/fishing.dart';
import 'package:flutter/material.dart';

class FishingArticleModel extends ChangeNotifier {
  List<Fishing>? fishings;

  void fetchBookList() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('books').get();

    final List articles = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String title = data['title'];
      final String type = data['type'];
      return Fishing(title, type);
    }).toList();

    this.fishings = articles.cast<Fishing>();
    notifyListeners();
  }
}