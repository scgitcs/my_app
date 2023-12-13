import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';

class DewPoint extends StatelessWidget {
  const DewPoint({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('DewPointPage page'),
      bottomNavigationBar: Nav(),
    );
  }
}
