import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginScreensController extends GetxController {
  LoginScreensView? view;
  var email = TextEditingController();
  var password = TextEditingController();
  String uidUsername = "";
  String uidUser = "";
  String uidEmail = "";

  bool isLoading = false;

  doLogin() async {
    debugPrint("email: ${email.text}");
    debugPrint("password: ${password.text}");
    var snapshot = await FirebaseFirestore.instance.collection("user").get();

    for (var i = 0; i < snapshot.docs.length; i++) {
      Map<String, dynamic> item = snapshot.docs[i].data();
      item["id"] = snapshot.docs[i].id;
      // print("email server:${item['email']} ");
      // print("password server:${item['password']} ");
      if (item['email'] == email.text.toString() &&
          item['password'] == password.text.toString()) {
        uidUser = item["id"];
        uidUsername = item["username"];
        uidEmail = item["email"];

        debugPrint("Status: berhasil login");
        Get.snackbar(
          "Success",
          "Berhasil Login",
          colorText: Colors.green,
        );
        // Get.to(const HomeScreensView());
        Get.to(const ChatScreensView());
        email.text = "";
        password.text = "";
        return;
      }
    }
    Get.snackbar(
      "Gagal",
      "Silahkan cek email dan password",
      colorText: Colors.red,
    );
  }
}
