import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_management_app/provider/provider.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../projects/project_in_progress.dart';
import 'components/projects_card.dart';
import 'components/status_card.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    fetchProjectsCount();
  }




  var totalProjects = 0;
  var inProgress = 0;
  var underReview = 0;
  var completed = 0;
  bool isLoading = true;

  Future<void> fetchProjectsCount() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('projects').get();
      int inProgressCount = 0;
      int underReviewCount = 0;
      int onHoldCount = 0;
      int completedCount = 0;

      for (var doc in querySnapshot.docs) {
        switch (doc['status']) {
          case 'active':
            inProgressCount++;
            break;
          case 'Review':
            underReviewCount++;
            break;
          case 'Completed':
            completedCount++;
            break;
        }
      }

      setState(() {
        totalProjects = querySnapshot.docs.length;
        inProgress = inProgressCount;
        underReview = underReviewCount;
        completed = completedCount;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching projects: $e');
      setState(() {
        isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top section with greeting and profile picture
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser!.email.toString() ??'username',
                      // 'Jonas Noah',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtuphMb4mq-EcVWhMVT8FCkv5dqZGgvn_QiA&s'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
                'Mastering Projects with Management',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300)
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.filter_list),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Project status summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatusCard(count: totalProjects.toString(), status: 'Total', color: Colors.purple,),
                StatusCard(count: inProgress.toString(), status: 'In Progress', color: Colors.blue),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatusCard(count: underReview.toString(), status: 'Under Review', color: Colors.orange),
                StatusCard(count: completed.toString(), status: 'Completed', color: Colors.green),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProjectCard(),
                  const SizedBox(width: 10),
                  ProjectCard(),
                ],
              ),
            )
            // ProjectCard(),
            // ProjectCard(),
            //ProjectsInProcess(),
          ],
        ),
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  const PlaceholderWidget(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}



