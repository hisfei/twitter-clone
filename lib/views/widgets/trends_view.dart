import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/home_menu_controller.dart';
import 'package:svmj_web/controllers/trends_controller.dart';
import 'package:svmj_web/models/trend_for_you.dart';
import 'package:svmj_web/routers/jump.dart';
import 'package:svmj_web/themes/light.dart';
import 'package:svmj_web/views/widgets/search.dart';

class TrendsView extends StatelessWidget {
  const TrendsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TrendsController controller = Get.find();
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.trends.isEmpty) {
        return const Center(child: Text('No trends available.'));
      } else {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Search(),
              const SizedBox(height: 20),
              // Expanded(
              //child:
              Container(
                //constraints: BoxConstraints(maxHeight: 840, minHeight: 100),
                width: 350,
                padding: const EdgeInsets.only(top: 15.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                    color: MyColor.borderGrey, // 设置边框颜色
                    width: 0.50, // 设置边框宽度
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 42,
                        child: SelectableText.rich(TextSpan(
                          text: '  ${'trendsforyou'.tr}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ))),
                    //Expanded(
                    //child:
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: controller.trends
                          .map((trend) => buildTrendItem(context, trend))
                          .toList(),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                //),
              ),
            ],
          ),
        );
      }
    });
  }

  Widget buildTrendItem(BuildContext context, Trend trend) {
    final HomeMenuController homeMenuController = Get.find();

    return InkWell(
      onTap: ()   {
        homeMenuController.changePage(1);
        JumpTo('/search');},
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, bottom: 5),

        /// margin: EdgeInsets.only(bottom: 10),
        // padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  trend.topic,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  trend.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  trend.tweetCount.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            // SizedBox(height: 10),
            IconButton(
              icon: const Icon(Icons.more_horiz_outlined),
              onPressed: () {
                _showCustomMenu(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    await showMenu(
      context: context,
      position: position,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      items: [
        const PopupMenuItem<int>(
          value: 0,
          child: Text('First Item'),
        ),
        const PopupMenuItem<int>(
          value: 1,
          child: Text('Second Item'),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text('Third Item'),
        ),
      ],
    );
  }
}
