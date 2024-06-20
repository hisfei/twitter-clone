import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/controllers/trends_controller.dart';
import 'package:svmj_web/models/trend_for_you.dart';
import 'package:svmj_web/views/widgets/border_container.dart';
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
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Search(),
              SizedBox(height: 20),
              // Expanded(
              //child:
              Container(
                //constraints: BoxConstraints(maxHeight: 840, minHeight: 100),
                width: 350,
                padding: const EdgeInsets.only(top: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                    color: Color(0xffe0e8eb), // 设置边框颜色
                    width: 0.50, // 设置边框宽度
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 42,
                        child: SelectableText.rich(TextSpan(
                          text: '  Trends for you',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ))),
                    //Expanded(
                    //child:
                    Container(
                      //height: 200,
                      //constraints: BoxConstraints(maxHeight: 780, minHeight: 0),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: controller.trends
                            .map((trend) => buildTrendItem(context, trend))
                            .toList(),
                      ),
                      //)
                    ),
                    SizedBox(height: 15),
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
    return InkWell(
      onTap: () => Get.toNamed('/search'),
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
                SizedBox(height: 10),
                Text(
                  trend.topic,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  trend.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  trend.tweetCount.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            // SizedBox(height: 10),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Options'),
                      content: Text('Choose an option.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Option 1'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Option 2'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
