

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService{

  Future<void> addProject(String status,String name, String description, String deadline,  String budget) async {
    try {
      await FirebaseFirestore.instance.collection('projects').add({
        'name': name,
        'description': description,
        'status': status, // You can customize this field as needed
        'created_at': FieldValue.serverTimestamp(),
        'budget': budget,
        'deadline': deadline,
      });
    } catch (e) {
      print('Error adding project: $e');
    }
  }


  Future<void> getProjects() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('projects').get();

      for (var doc in querySnapshot.docs) {
        print('${doc.id} => ${doc.data()}');
      }
    } catch (e) {
      print('Error getting projects: $e');
    }
  }


  Future<void> getProjectsByStatus(String status) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('projects')
          .where('status', isEqualTo: status)
          .get();

      for (var doc in querySnapshot.docs) {
        print('${doc.id} => ${doc.data()}');
      }
    } catch (e) {
      print('Error getting projects: $e');
    }
  }

  Future<void> updateProject(String projectId, Map<String, dynamic> updates) async {
    try {
      await FirebaseFirestore.instance.collection('projects').doc(projectId).update(updates);
    } catch (e) {
      print('Error updating project: $e');
    }
  }

  Future<void> deleteProject(String projectId) async {
    try {
      await FirebaseFirestore.instance.collection('projects').doc(projectId).delete();
    } catch (e) {
      print('Error deleting project: $e');
    }
  }

  Future<void> createUser(String email, String userName, ) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': email,
      'userName': userName,
    });
  }

}