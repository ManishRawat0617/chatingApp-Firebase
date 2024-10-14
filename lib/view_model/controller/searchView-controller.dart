import 'package:chat_app_firebase/utilis/utilis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchViewModel extends GetxController {
  final searchController = TextEditingController();

  // More specific types for lists
  RxList<String> fetchedUser = <String>[].obs; // List of all users' emails
  RxList<String> fetchedUserPhone = <String>[].obs; // List of all users' phones
  RxList<String> filterPeople = <String>[].obs; // Filtered list for search
  RxList<String> allUsers = <String>[].obs; // All users' emails
  RxBool isLoading = true.obs;

  // Firebase instance should be outside the function for better reusability
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Fetch users from Firestore
  Future<void> fetchUsers() async {
    try {
      final querySnapshot = await _firebaseFirestore.collection('users').get();

      if (querySnapshot.docs.isNotEmpty) {
        fetchedUser.clear();
        fetchedUserPhone.clear();

        for (var docSnapshot in querySnapshot.docs) {
          final Map<String, dynamic> data =
              docSnapshot.data() as Map<String, dynamic>;

          final String? email = data['email'] as String?;
          final String? phone = data['phoneNumber'] as String?;

          // Add only if email is not null
          if (email != null &&
              email.isNotEmpty &&
              email != _auth.currentUser!.email.toString()) {
            fetchedUser.add(email);
          }

          // Add only if phone is not null
          if (phone != null && phone.isNotEmpty) {
            fetchedUserPhone.add(phone);
          }
        }

        // Initially, show all users
        allUsers.assignAll(fetchedUser);
        filterPeople.assignAll(fetchedUser);
      }

      isLoading.value = false; // Set loading to false when done
    } catch (err) {
      if (kDebugMode) {
        print("Error fetching data: $err");
      }
      Utilis.toastMessage(err.toString());
    }
  }

  // Filter search results based on query
  void filterSearch(String query) {
    if (query.isEmpty) {
      // Show all users if search query is empty
      filterPeople.assignAll(fetchedUser);
    } else {
      // Filter based on the query
      final filteredList = fetchedUser
          .where((email) => email.toLowerCase().contains(query.toLowerCase()))
          .toList();

      filterPeople.assignAll(filteredList);
    }
  }

  @override
  void onClose() {
    searchController.dispose(); // Dispose controller when the view is closed
    super.onClose();
  }
}
