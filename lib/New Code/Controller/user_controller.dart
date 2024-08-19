import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Model/user.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;
  var filteredUsers = <User>[].obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      final querySnapshot = await FirebaseFirestore.instance.collection('users').get();
      users.value = querySnapshot.docs.map((doc) {
        return User.fromDocument(doc);
      }).toList();
      filteredUsers.value = users;
    } finally {
      isLoading(false);
    }
  }

  void filterUsers(String query) {
    if (query.isEmpty) {
      filteredUsers.value = users;
    } else {
      filteredUsers.value = users.where((user) {
        return user.employeeName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}