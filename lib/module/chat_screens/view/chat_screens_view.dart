import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreensView extends StatelessWidget {
  const ChatScreensView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreensController>(
      init: ChatScreensController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: const Color(0xff292F3F),
          appBar: AppBar(
            centerTitle: true,
            title: Text("Chattskuy",
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            backgroundColor: const Color(0xff0E181E),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  otherAccountsPictures: const [],
                  accountName: Text(controller.loginPage.uidUsername),
                  accountEmail: Text(controller.loginPage.uidEmail),
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xff0E181E),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text("Logout"),
                  onTap: () {
                    Get.off(const LoginScreensView());
                  },
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Card(
                    color: const Color(0xff373E4E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Text("G"),
                      ),
                      title: const Text(
                        "Chat Grup",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Get.to(const HomeScreensView());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
