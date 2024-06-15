import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/views/globle_layout.dart';

class ProfilePageBase extends StatelessWidget {
  const ProfilePageBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Profile"),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobleLayout(
      widget: ProfilePageBase(),
    );
  }
}
