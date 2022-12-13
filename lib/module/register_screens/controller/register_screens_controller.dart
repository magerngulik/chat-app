import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreensController extends GetxController {
  RegisterScreensView? view;

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  doRegister() async {
    debugPrint("username: ${username.text}");
    debugPrint("email: ${email.text}");
    debugPrint("password: ${password.text}");
    var snapshot = await FirebaseFirestore.instance.collection("user").get();

    for (var i = 0; i < snapshot.docs.length; i++) {
      Map<String, dynamic> item = snapshot.docs[i].data();
      item["id"] = snapshot.docs[i].id;
      if (item['email'] == email.text.toString()) {
        Get.snackbar(
          "Warning",
          "Email ini sudah di gunakan, Harap ganti email",
          colorText: Colors.red,
        );
        return;
      }
    }
    isLoading = true;
    update();

    await FirebaseFirestore.instance.collection("user").add({
      "username": username.text,
      "email": email.text,
      "password": password.text,
    });
    Get.snackbar("Berhasil Register", "Silahkan Login");
    isLoading = false;
    update();
    Get.off(LoginScreensView());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    email.dispose();
    username.dispose();
    password.dispose();
  }
}
