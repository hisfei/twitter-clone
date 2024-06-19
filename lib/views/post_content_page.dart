import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/views/widgets/globle_layout.dart';
import 'package:svmj_web/views/login_page.dart';

class PostContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PostContentPageBase();
  }
}

class PostContentPageBase extends StatelessWidget {
  PostContentPageBase({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.parameters['postCode'];

    final d = Get.parameters['replyCode'];

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IconButton(onPressed: Get.back(), icon: Icon)
            IconButton(
                onPressed: () {
                  Get.back();
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
