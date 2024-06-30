import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  final String name;
  final String status;
  final String description;
  final String deadline;
  final String budget;

  Project({
    required this.name,
    required this.status,
    required this.description,
    required this.deadline,
    required this.budget,
  });

  factory Project.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Project(
      name: data['name'] ?? '',
      status: data['status'] ?? '',
      description: data['description'] ?? '',
      deadline: data['deadline'] ?? '',
      budget: data['budget'] ?? '',
    );
  }
}
