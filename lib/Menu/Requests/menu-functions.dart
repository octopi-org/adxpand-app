import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/history-choices.dart';
import 'package:applify/Menu/Requests/my-settings.dart';

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
  pageRoute: HistoryPage('kwresearch'),
);
//campaign
//ad grp
//ad
//search
//get request

final adPerf = MenuItemData(
  itemName: 'Ad Performance',
  pageRoute: HistoryPage('adperf'),
);
//campaign
//ad grp
//ad
//search
//get request

final adCopCh = MenuItemData(
  itemName: 'Ad Change History',
  pageRoute: HistoryPage('adcopch'),
);
//sqlite

final newCamp = MenuItemData(
  itemName: 'New Campaign',
  pageRoute: Settings('newcamp'),
);
// STATE 1: + everything here is all text field
//STATE 2:
//dropdown menu campaign
//^ ad grp
//^ ad
//DROPDOWN WITH:
//keywords                     upload csv placeholder, add negative keywords, del neg keywords, add keywords, delete keywords
//ad schedule                  range or single date and time
//ad budget                    number fields w 2 decimal, dropdown w 2 options (cost per click and total cost in a day)
//ad details                   dropdown for ad title (30 chars) and ad description (90 chars)

final exAdSet = MenuItemData(
  itemName: 'Existing Ad Settings',
  pageRoute: Settings('exadset'),
);
// STATE 1: + sign and confirm/send sign
//STATE 2:
//dropdown menu campaign
//^ ad grp
//^ ad
//DROPDOWN WITH:
//keywords                     add negative keywords, del neg keywords, add keywords, delete keywords
//ad schedule                  range or single date and time
//ad budget                    number fields w 2 decimal, dropdown w 2 options (cost per click and total cost in a day)
//ad details                   dropdown for ad title (30 chars) and ad description (90 chars)
// goes into ad change history

final aud = MenuItemData(
  itemName: 'Audit',
  pageRoute: Settings('aud'),
);
//post request
//campaign based on getrequest
//ad grp based on getrequest
//ad based on getrequest
//date range

final detRep = MenuItemData(
  itemName: 'Detailed Report',
  pageRoute: Settings('detrep'),
);
//post request
//date range

final oth = MenuItemData(
  itemName: 'Others',
  pageRoute: Settings('oth'),
);
//post request
//subject field
//text field