import 'package:flutter/material.dart';

import '../../../Constants/constant.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key, this.tabController});
  final tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      labelColor: kprimaryColor,
      unselectedLabelColor: const Color(0xff79828a),
      labelStyle: const TextStyle(
        fontFamily: 'Readex Pro',
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelStyle: const TextStyle(),
      indicatorColor: kprimaryColor,
      tabs: const [
        Tab(
          text: 'Verify Account',
        ),
        Tab(
          text: 'Archive Account',
        ),
      ],
      onTap: (i) async {
        [() async {}, () async {}][i]();
      },
    );
  }
}
