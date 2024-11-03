import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollections);

  TextEditingController controller = TextEditingController();

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KTime).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              Message.fromJson(snapshot.data!.docs[i]),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    'Chat',
                    style: TextStyle(fontFamily: 'Pacifico', fontSize: 24),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        message: messagesList[index],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add(
                        {
                          KMessage: data,
                          KTime: DateTime.now(),
                        },
                      );
                      controller.clear();
                      _controller.animateTo(
                        _controller.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        color: kPrimaryColor,
                        icon: const Icon(Icons.send),
                      ),
                      hintText: 'Message',
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
