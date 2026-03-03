import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_feature_controller.dart';

class SearchFeatureView extends GetView<SearchFeatureController> {
  const SearchFeatureView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchFeatureView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchFeatureView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
