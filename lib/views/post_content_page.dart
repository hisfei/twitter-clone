import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/routers/jump.dart';
 import 'package:svmj_web/views/login_page.dart';
import 'package:svmj_web/views/web_globle_layout.dart';

class PostContentPage extends StatelessWidget {
  // final AnotherController anotherController = Get.put();

  @override
  Widget build(BuildContext context) {
    String c = Get.parameters['postCode']??'';

    String d = Get.parameters['replyCode']??'';
    return GlobleWebLayout(widget: PostContentPageBase(postCode: c, replyCode: d,));
  }
}


class PostContentPageBase extends StatelessWidget {
final String postCode;
final String replyCode;
PostContentPageBase({super.key, required this.postCode, required this.replyCode});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IconButton(onPressed: Get.back(), icon: Icon)
            IconButton(
                onPressed: () {
                  JumpBack();

                },
                icon: const Icon(Icons.arrow_back)),
            Text(postCode),
            Text(replyCode),
            SelectableText.rich(TextSpan(
              text: ' item.title',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //dataController.changePage(3); // 切换到 content_page

                  Get.to(LoginPage() );
                },
            )),
          ],
        ),
      ),
    );
  }
}
