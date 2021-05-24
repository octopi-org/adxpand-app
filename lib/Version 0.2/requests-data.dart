import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/history-choices.dart';
import 'package:applify/Menu/Requests/my-settings.dart';

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
  pageRoute: HistoryPage('kwresearch'),
);

final adPerf = MenuItemData(
  itemName: 'Ad Performance',
  pageRoute: HistoryPage('adperf'),
);

final adCopCh = MenuItemData(
  itemName: 'Ad Change History',
  pageRoute: HistoryPage('adcopch'),
);

final newCamp = MenuItemData(
  itemName: 'New Campaign',
  pageRoute: Settings('newcamp'),
);

final exAdSet = MenuItemData(
  itemName: 'Existing Ad Settings',
  pageRoute: Settings('exadset'),
);

final aud = MenuItemData(
  itemName: 'Audit',
  pageRoute: Settings('aud'),
);

final detRep = MenuItemData(
  itemName: 'Detailed Report',
  pageRoute: Settings('detrep'),
);

final oth = MenuItemData(
  itemName: 'Others',
  pageRoute: Settings('oth'),
);