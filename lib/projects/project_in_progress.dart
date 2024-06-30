import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';

class ProjectsInProcess extends StatelessWidget {
  const ProjectsInProcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<ProjectProvider>(context, listen: false).fetchProjects(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Consumer<ProjectProvider>(
              builder: (context, projectProvider, child) {
                if (projectProvider.projects.isEmpty) {
                  return const Center(child: Text('No projects found'));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: projectProvider.projects.length,
                  itemBuilder: (context, index) {
                    final project = projectProvider.projects[index];
                    if(project.status == 'active'){
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          title: Text(project.name),
                          subtitle: Text(project.status),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(project.deadline),
                              Text('Budget:' + project.budget),
                            ],
                          ),
                          onTap: () {

                          },
                        ),
                      );
                    }
                    else {
                      return const SizedBox.shrink();
                    }

                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
