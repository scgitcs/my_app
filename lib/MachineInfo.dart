
import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';
class MachineInfo extends StatelessWidget {
  const MachineInfo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Machine Information page'),
      bottomNavigationBar: Nav(),
    );
  }
}