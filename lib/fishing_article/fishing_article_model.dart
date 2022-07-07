import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../domain/fishing.dart';

class FishingArticleModel extends ChangeNotifier{
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('articles')
      .snapshots();

  List<Fishing>? articles;

  void fetchFishingArticle(){
    _usersStream.listen((QuerySnapshot snapshot) {
      final List<Fishing> articles = snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data =
        document.data()! as Map<String, dynamic>;
        final String title = data['title'];
        final String type = data['type'];
        return Fishing(title, type);
      }).toList();
      this.articles = articles;
      notifyListeners();
    });

  }
}