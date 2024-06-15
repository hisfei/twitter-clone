import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/post_content_controller.dart';
import 'package:svmj_web/views/login_page.dart';

class PostContentPage extends StatelessWidget {
  PostContentDataController postContentDataController = Get.find();

  PostContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    int c = postContentDataController.postCode.value;
    int d = postContentDataController.replyCode.value;

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IconButton(onPressed: Get.back(), icon: Icon)
            IconButton(
                onPressed: () {
                  Get.back(id: 2);
                },
                icon: const Icon(Icons.arrow_back)),
            Text('$c'),
            Text('$d'),
            SelectableText.rich(TextSpan(
              text: ' item.title',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //dataController.changePage(3); // 切换到 content_page

                  Get.to(LoginPage(), id: 2);
                },
            )),
          ],
        ),
      ),
    );
  }
}
