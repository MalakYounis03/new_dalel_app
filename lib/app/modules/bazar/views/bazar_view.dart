import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bazar_controller.dart';

class BazarView extends GetView<BazarController> {
  const BazarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BazarView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BazarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
