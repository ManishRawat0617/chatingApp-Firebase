import 'package:chat_app_firebase/resources/color/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChatPageView extends StatefulWidget {
  final String? receiverName;
  final String? receiverPhone;
  const ChatPageView({super.key, this.receiverName, this.receiverPhone});

  @override
  State<ChatPageView> createState() => _ChatPageViewState();
}

class _ChatPageViewState extends State<ChatPageView> {
  final TextEditingController _messageController = TextEditingController();
  // final DatabaseReference databaseref =
  //     FirebaseDatabase.instance.ref('messages');
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  // Post a message to Firebase Realtime Database
  void postMessage(String message) {
    // Replace invalid characters in email and receiver's name
    final senderEmail =
        _auth.currentUser?.email?.replaceAll(RegExp(r'[.#$[\]]'), ',') ??
            'unknown';
    final receiverName =
        widget.receiverName?.replaceAll(RegExp(r'[.#$[\]]'), ',') ?? 'unknown';

    final chatId = "$receiverName";
    final DatabaseReference databaseref = database.ref(senderEmail);
    databaseref.child(chatId).push().set({
      "id": DateTime.now().millisecondsSinceEpoch.toString(),
      "msg": message,
      "sender": senderEmail,
      "receiver": receiverName,
      "timestamp": DateTime.now().toString()
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send message: $error")),
      );
    });
  }

  // Stream to listen to real-time chat messages
  Stream<DatabaseEvent> getMessageStream() {
    final senderEmail =
        _auth.currentUser?.email?.replaceAll(RegExp(r'[.#$[\]]'), ',') ??
            'unknown';
    final receiverName =
        widget.receiverName?.replaceAll(RegExp(r'[.#$[\]]'), ',') ?? 'unknown';
    final DatabaseReference databaseref = database.ref(senderEmail);
    final chatId = "${receiverName}";
    return databaseref.child(chatId).orderByChild('timestamp').onValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBar,
        title: Text(widget.receiverName ?? "Chat"),
      ),
      body: Column(
        children: [
          // Message list displaying chat messages in real-time
          Expanded(
            child: StreamBuilder<DatabaseEvent>(
              stream: getMessageStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
                  Map<dynamic, dynamic> messages =
                      snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                  List<Map<String, dynamic>> messageList = messages.values
                      .map((message) => Map<String, dynamic>.from(message))
                      .toList();

                  return ListView.builder(
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      final message = messageList[index];
                      final isSender =
                          message['sender'] == _auth.currentUser?.email;
                      return Align(
                        alignment: isSender
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color:
                                isSender ? Colors.blue[100] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message['msg'] ?? '',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  print("Error is from here");
                  print(snapshot.error);
                  print("end for message");
                  return const Center(child: Text("Error loading messages : "));
                } else {
                  return const Center(child: Text("No messages found"));
                }
              },
            ),
          ),
          // Input field for typing and sending messages
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      postMessage(_messageController.text);
                      _messageController
                          .clear(); // Clear the input field after sending
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
