import 'package:applify/Pseudo-VCS/ad-change-history.dart';
import 'package:flutter/material.dart';
import 'package:applify/Version 0.2/Requests-Subpages/keyword-research.dart';
import 'package:applify/Version 0.2/Requests-Subpages/ad-performance.dart';
import 'package:applify/Version 0.2/Requests-Subpages/ad-change-history.dart';
import 'package:applify/Version 0.2/Requests-Subpages/new-campaign.dart';
import 'package:applify/Version 0.2/Requests-Subpages/existing-ad-settings.dart';
import 'package:applify/Version 0.2/Requests-Subpages/audit.dart';
import 'package:applify/Version 0.2/Requests-Subpages/detailed-report.dart';
import 'package:applify/Version 0.2/Requests-Subpages/others.dart';

List<CardData> cardList = [historyCard, changeCard, customCard];

class CardData {
  String cardName;
  List menuItems;
  CardData({this.cardName, this.menuItems});
}

class MenuItemData {
  String itemName;
  Widget pageRoute;
  MenuItemData({this.itemName, this.pageRoute});
}

final historyCard = CardData(
  cardName: 'Request History',
  menuItems: [kWResearch, adPerf, adCopCh],
);

final changeCard = CardData(
  cardName: 'Change Requests',
  menuItems: [newCamp, exAdSet],
);

final customCard = CardData(
  cardName: 'Custom Requests',
  menuItems: [aud, detRep, oth],
);

/*
final historyMenuItem = [kWResearch, adPerf, adCopCh];
final changeMenuItem = [newCamp, exAdSet];
final customMenuItem = [aud, detRep, oth];
*/

final kWResearch = MenuItemData(
  itemName: 'KW Research',
  pageRoute: KeywordResearch(),
);

final adPerf = MenuItemData(
  itemName: 'Ad Performance',
  pageRoute: AdPerformance(),
);

final adCopCh = MenuItemData(
  itemName: 'Ad Change History',
  pageRoute: AdChangeHistoryPage(),
);

final newCamp = MenuItemData(
  itemName: 'New Campaign',
  pageRoute: NewCampaign(),
);

final exAdSet = MenuItemData(
  itemName: 'Existing Ad Settings',
  pageRoute: ExistingAdSettings(),
);

final aud = MenuItemData(
  itemName: 'Audit',
  pageRoute: Audit(),
);

final detRep = MenuItemData(
  itemName: 'Detailed Report',
  pageRoute: DetailedReport(),
);

final oth = MenuItemData(
  itemName: 'Others',
  pageRoute: Others(),
);