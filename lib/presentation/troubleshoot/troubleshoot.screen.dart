import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/troubleshoot.controller.dart';

class TroubleshootScreen extends GetView<TroubleshootController> {
  const TroubleshootScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TroubleshootScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TroubleshootScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
