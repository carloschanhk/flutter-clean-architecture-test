import 'package:clean_architecture_test/router/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clean Architecture"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeNavigationButton(
            route: Routes.NOTE,
            text: "Note",
          ),
          HomeNavigationButton(
            route: Routes.COUNTER,
            text: "Counter",
          ),
          HomeNavigationButton(
            route: Routes.SMS,
            text: "SMS",
          ),
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}

class HomeNavigationButton extends StatelessWidget {
  const HomeNavigationButton({
    Key? key,
    @required this.route,
    @required this.text,
  }) : super(key: key);

  final route;
  final text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Get.toNamed(route);
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
      ).paddingSymmetric(vertical: 10, horizontal: 20),
    );
  }
}
