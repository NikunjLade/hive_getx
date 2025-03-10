import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_project.dart';
import 'project_controller.dart';

class ProjectListScreen extends StatelessWidget {
  final ProjectController projectController = Get.put(ProjectController());

  ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Get.to(() => AddProjectScreen()),
          ),
        ],
      ),
      body: Obx(() {
        if (projectController.projects.isEmpty) {
          return const Center(child: Text("No Projects Found"));
        }
        return ListView.builder(
          itemCount: projectController.projects.length,
          itemBuilder: (context, index) {
            var project = projectController.projects[index];
            return ListTile(
              title: Text(project['name']),
              subtitle: Text("Start: ${project['startDate']} - End: ${project['endDate']}"),
            );
          },
        );
      }),
    );
  }
}
