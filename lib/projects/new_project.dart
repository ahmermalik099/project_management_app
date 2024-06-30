// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_management_app/services/storage.dart';

class AddNewProject extends StatelessWidget {
  AddNewProject({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController budgetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Add Project', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Category', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
              DropdownButton(
                isExpanded: true,
                style: TextStyle(color: Colors.black,),
                hint: Text('Select Project Category'),
                items: <String>['Web', 'Mobile App', 'AI']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {},

              ),

    
              SizedBox(height: 20),
              Text('Project Title', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Enter Project Title',
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Details', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: TextField(
                  controller: detailsController,
                  decoration: InputDecoration(
                    hintText: 'Enter Project Details',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  maxLines: 5,
                ),
              ),
              SizedBox(height: 20),
              Text('Dead Line', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
              TextFormField(
                controller: deadlineController,
                decoration: InputDecoration(
                  hintText: 'Enter Project Deadline',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Budget', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
              TextFormField(
                controller: budgetController,
                decoration: InputDecoration(
                  hintText: 'Enter Project Budget',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                    onPressed: (){
                      FirestoreService().addProject('Review',titleController.text, detailsController.text, deadlineController.text, budgetController.text);
                      SnackBar snackBar = SnackBar(content: Text('Project Added Successfully'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),

                      ),
                    ),
                    child: Text('Add Project', style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
