import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  var projects = <Map<String, dynamic>>[].obs;
  var name = ''.obs;
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();
  var members = <String>[].obs;
  var memberInput = ''.obs;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void onInit() {
    fetchProjects();
    super.onInit();
  }

  void fetchProjects() {
    _db.collection('projects').snapshots().listen((snapshot) {
      projects.value = snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
    });
  }

  Future<void> addProject() async {
    if (name.value.isEmpty || startDate.value == null || endDate.value == null || members.isEmpty) {
      Get.snackbar("Error", "Please fill all fields", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    await _db.collection('projects').add({
      'name': name.value,
      'startDate': startDate.value!.toIso8601String(),
      'endDate': endDate.value!.toIso8601String(),
      'members': members,
    });

    // Reset form
    name.value = '';
    startDate.value = null;
    endDate.value = null;
    members.clear();
    Get.back();
  }
}
