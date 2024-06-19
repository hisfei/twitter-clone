import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/trends_controller.dart';
import 'package:svmj_web/models/trend_for_you.dart';
import 'package:svmj_web/views/widgets/search.dart';

class TrendsView extends StatelessWidget {
  const TrendsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TrendsController controller = Get.find();

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (controller.trends.isEmpty) {
        return Center(child: Text('No trends available.'));
      } else {
        return Container(
          margin: const EdgeInsets.only(left: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Search(),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                border: Border.all(
                  color: Color(0xffe0e8eb), // 设置上边框颜色
                  width: 0.50, // 设置上边框宽度
                ),
              ),
              child: GestureDetector(
                  onTap: () {
                    print('Column 被点击了！');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trends for you',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ...controller.trends
                          .map((trend) => buildTrendItem(trend))
                          .toList(),
                    ],
                  )),
            )
          ]),
        );
      }
    });
  }

  Widget buildTrendItem(Trend trend) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trend.topic,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 4),
        Text(
          trend.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          trend.tweetCount.toString(),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget listTitle(Trend trend) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trend.topic,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 4),
        Text(
          trend.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          trend.tweetCount.toString(),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
