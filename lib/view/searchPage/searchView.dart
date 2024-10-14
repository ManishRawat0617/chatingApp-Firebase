import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:chat_app_firebase/view/chatPage/chatPage.dart';
import 'package:chat_app_firebase/view_model/controller/searchView-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchViewModel searchViewController = Get.put(SearchViewModel());

  @override
  void initState() {
    super.initState();
    searchViewController
        .fetchUsers(); // Fetch users once when the view initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBar,
        title: const Text("Search User"),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (searchViewController.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator()); // Loading indicator
          } else if (searchViewController.filterPeople.isEmpty) {
            return const Center(child: Text("No users found")); // Empty state
          } else {
            return Column(
              children: [
                // Search bar
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: searchViewController.searchController,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onChanged: (value) {
                      searchViewController.filterSearch(value);
                    },
                  ),
                ),
                const SizedBox(height: 4),

                // List of filtered users
                Expanded(
                  child: ListView.builder(
                    itemCount: searchViewController.filterPeople.length,
                    itemBuilder: (context, index) {
                      final user = searchViewController.filterPeople[index];
                      final userNumber =
                          searchViewController.fetchedUserPhone[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(ChatPageView(
                            receiverName: user,
                            receiverPhone: userNumber,
                          ));
                        },
                        child: Card(
                          color: AppColor.appBackgroundTeal.withOpacity(0.15),
                          child: ListTile(
                            leading: Icon(Icons.person, color: AppColor.appBar),
                            title: Text(
                              user,
                              style: const TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              userNumber,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
