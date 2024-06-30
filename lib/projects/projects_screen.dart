// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_management_app/projects/all_projects.dart';
import 'package:project_management_app/projects/project_in_progress.dart';
import 'package:project_management_app/projects/projects_%20under_review.dart';

import '../HomePage/homepage_screen.dart';
import 'new_project.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;
  void initState() {

    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Projects',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewProject()));
                      },
                      child: Text('+ Add project', style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                  ),

                ],
              ),
              SizedBox(height: 20),
              TabBar(
                controller: tabController,
                  tabs:
                  [
                    Tab(text: 'All projects'),
                    Tab(text: 'In progress'),
                    Tab(text: 'Under Review'),
                  ]
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                    children: [
                      AllProjectsScreen(),
                      ProjectsInProcess(),
                      ProjectsUnderReview(),
                    ]
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}


