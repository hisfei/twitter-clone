import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svmj_web/views/globle_layout.dart';

class SearchPageBase extends StatelessWidget {
  const SearchPageBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobleLayout(
      widget: SearchPageBase(),
    );
  }
}
