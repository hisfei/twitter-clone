import 'package:flutter/material.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          snap: true,
          title: Text('Recommendations'),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('Recommendation $index')),
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
