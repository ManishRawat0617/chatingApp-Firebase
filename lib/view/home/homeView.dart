import 'package:chat_app_firebase/data/network/userDetails.dart';
import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:chat_app_firebase/resources/strings/appStrings.dart';
import 'package:chat_app_firebase/view/chatPage/chatPage.dart';
import 'package:chat_app_firebase/view/profile/profileView.dart';
import 'package:chat_app_firebase/view/searchPage/searchView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserDetails userDetail = UserDetails();

  // List to hold user details that you have messaged
  List<Map<String, dynamic>> _messagedUsers = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchMessagedUsers();
  // }

  // // Function to fetch messaged users
  // Future<void> _fetchMessagedUsers() async {
  //   // Replace this with your method to fetch users you have messaged
  //   // List<Map<String, dynamic>> users = await userDetail.getMessagedUsers();

  //   // Order users by last message timestamp (assumed to be a field in the user data)
  //   users.sort((a, b) => b['lastMessageTime'].compareTo(a['lastMessageTime']));

  //   setState(() {
  //     _messagedUsers = users; // Update the state with the sorted list
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBar,
        leading: const Icon(
          Icons.menu,
          size: 30,
          color: AppColor.white,
        ),
        title: const Text(
          AppString.appTitle,
          style: TextStyle(
              color: AppColor.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async {
              Map<String, dynamic> userDetails =
                  await userDetail.userName() as Map<String, dynamic>;

              Get.to(Profileview(
                userName: userDetails['userName'],
                email: userDetails['email'],
                phoneNumber: userDetails['phoneNumber'],
                firstName: userDetails['firstName'],
                lastName: userDetails['lastName'],
              ));
            },
            child: const Icon(
              Icons.person,
              size: 30,
              color: AppColor.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                Get.to(SearchView());
              },
              child: const Text(
                "Show all users",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20), // Add some space
            Expanded(
              child: _messagedUsers.isEmpty
                  ? Center(
                      child: Text('No users messaged yet.')) // No users case
                  : ListView.builder(
                      itemCount: _messagedUsers.length,
                      itemBuilder: (context, index) {
                        final user = _messagedUsers[index];
                        return ListTile(
                          title: Text(user['userName'] ?? 'Unknown User'),
                          subtitle: Text(
                              'Last message time: ${user['lastMessageTime']}'), // Show last message time
                          onTap: () {
                            //  Get.to(ChatPageView(receiverName: )); // Navigate to chat page
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for floating button
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
