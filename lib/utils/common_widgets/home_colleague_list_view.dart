import 'package:flutter/material.dart';

import '../misc/app_text_theme.dart';
import 'home_colleague_card.dart';
import '../../screens/globals.dart' as globals;

class HomeColleaguesListView extends StatefulWidget {
  const HomeColleaguesListView({Key key}) : super(key: key);

  @override
  State<HomeColleaguesListView> createState() => _HomeColleaguesListViewState();
}

class _HomeColleaguesListViewState extends State<HomeColleaguesListView> {
  double edgeInsetTop = 0.0;
  double edgeInsetBottom = 16.0;
  List<dynamic> captureList;
  @override
  void initState() {
    captureList = globals.userPersona.toLowerCase() == 'sairam'
        ? globals.sairamColleagueCaptureList
        : globals.vineetColleagueCaptureList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Colleagues',
            style: AppTextTheme.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4F697C)),
            textAlign: TextAlign.left,
          ),
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding:
                EdgeInsets.only(top: edgeInsetTop, bottom: edgeInsetBottom),
            itemCount: captureList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return HomeColleagueCard(
                captureItem: captureList[index],
              );
            })
      ],
    );
  }
}
