import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/history-choices.dart';

class MenuItemData {
  String itemName;
  Widget pageRoute;
  MenuItemData({this.itemName, this.pageRoute});
}

final historyMenuItem = [kWResearch, adPerf, adCopCh];
final changeMenuItem = [newCamp, exAdSet];
final customMenuItem = [aud, detRep, oth];

final kWResearch = MenuItemData(
  itemName: 'KW Research',
  pageRoute: KWResearch(),
);

final adPerf = MenuItemData(
  itemName: 'Ad Performance',
  pageRoute: KWResearch(),
);

final adCopCh = MenuItemData(
  itemName: 'Ad Change History',
  pageRoute: KWResearch(),
);

final newCamp = MenuItemData(
  itemName: 'New Campaign',
  pageRoute: KWResearch(),
);

final exAdSet = MenuItemData(
  itemName: 'Existing Ad Settings',
  pageRoute: KWResearch(),
);

final aud = MenuItemData(
  itemName: 'Audit',
  pageRoute: KWResearch(),
);

final detRep = MenuItemData(
  itemName: 'Detailed Report',
  pageRoute: KWResearch(),
);

final oth = MenuItemData(
  itemName: 'Others',
  pageRoute: KWResearch(),
);