import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/middlewares/auth_middleware.dart';
import 'package:svmj_web/views/home_page.dart';
import 'package:svmj_web/views/login_page.dart';
import 'package:svmj_web/views/post_content_page.dart';
import 'package:svmj_web/views/profile_page.dart';
import 'package:svmj_web/views/search_page.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unknown Route'),
      ),
      body: Center(
        child: Text('404 - Page Not Found'),
      ),
    );
  }
}
