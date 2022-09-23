import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../misc/app_text_theme.dart';
import '../shared/profile_avatar.dart';

class ColleagueHeader extends StatelessWidget {
  const ColleagueHeader({
    // @required this.colleague,
    @required this.colleagueName,
    @required this.prismSummaryUnlocked,
    @required this.detailsTitle,
    @required this.detailsSubtitle,
    @required this.navigateToColleagueDetails,
    @required this.highlightSubtitle,
    Key key,
  }) : super(key: key);

  // final Colleague colleague;
  final String colleagueName;
  final bool prismSummaryUnlocked;
  final String detailsTitle;
  final String detailsSubtitle;
  final Function navigateToColleagueDetails;
  final bool highlightSubtitle;

  @override
  Widget build(BuildContext context) {
    return HeaderWithProfilePicture(
      // colleague: colleague,
      colleagueName: colleagueName,
      detailsSubtitle: detailsSubtitle,
      detailsTitle: detailsTitle,
      navigateToColleagueDetails: navigateToColleagueDetails,
      prismSummaryUnlocked: prismSummaryUnlocked,
      highlightSubtitle: highlightSubtitle,
      wellnessEnabled: false,
    );
  }
}

@visibleForTesting
class HeaderWithProfilePicture extends StatelessWidget {
  const HeaderWithProfilePicture({
    // @required this.colleague,
    @required this.colleagueName,
    @required this.prismSummaryUnlocked,
    @required this.detailsTitle,
    @required this.detailsSubtitle,
    @required this.navigateToColleagueDetails,
    @required this.highlightSubtitle,
    @required this.wellnessEnabled,
    Key key,
  }) : super(key: key);

  // final Colleague colleague;
  final String colleagueName;
  final bool prismSummaryUnlocked;
  final String detailsTitle;
  final String detailsSubtitle;
  final Function navigateToColleagueDetails;
  final bool highlightSubtitle;
  final bool wellnessEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
              bottom: 10,
            ),
            child: ProfileAvatar(
              image:
                  detailsSubtitle != '' ? NetworkImage(detailsSubtitle) : null,
              radius: 22,
              showInitials: detailsSubtitle == '',
              name: colleagueName,
              enableEmoji: false,
              borderColor: Colors.transparent,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  colleagueName ?? 'Unknown',
                  style: AppTextTheme.poppins(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    height: 1.13,
                    color: const Color(0xFF4F697C),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Last capture was $detailsTitle',
                    style: AppTextTheme.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C9AB5),
                      height: 1.3,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
