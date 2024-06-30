
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/model.dart';

class ProjectProvider with ChangeNotifier {
  List<Project> _projects = [];

  List<Project> get projects => _projects;

  Future<void> fetchProjects() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('projects').get();
      _projects = querySnapshot.docs.map((doc) => Project.fromFirestore(doc)).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching projects: $e');
    }
  }
}