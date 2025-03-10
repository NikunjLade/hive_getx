import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'project_controller.dart';

class AddProjectScreen extends StatelessWidget {
  final ProjectController projectController = Get.find();

  AddProjectScreen({super.key});

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      if (isStartDate) {
        projectController.startDate.value = picked;
      } else {
        projectController.endDate.value = picked;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Project")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => projectController.name.value = value,
              decoration: const InputDecoration(labelText: "Project Name"),
            ),
            Obx(() => Row(
              children: [
                Expanded(
                  child: Text(projectController.startDate.value == null
                      ? "Select Start Date"
                      : "Start: ${projectController.startDate.value!.toLocal()}".split(' ')[0]),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, true),
                ),
              ],
            )),
            Obx(() => Row(
              children: [
                Expanded(
                  child: Text(projectController.endDate.value == null
                      ? "Select End Date"
                      : "End: ${projectController.endDate.value!.toLocal()}".split(' ')[0]),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, false),
                ),
              ],
            )),
            TextField(
              onChanged: (value) => projectController.memberInput.value = value,
              decoration: InputDecoration(
                labelText: "Team Member",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (projectController.memberInput.value.isNotEmpty) {
                      projectController.members.add(projectController.memberInput.value);
                      projectController.memberInput.value = '';
                    }
                  },
                ),
              ),
            ),
            Obx(() => Wrap(
              children: projectController.members
                  .map((member) => Chip(label: Text(member)))
                  .toList(),
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: projectController.addProject,
              child: const Text("Save Project"),
            )
          ],
        ),
      ),
    );
  }
}
