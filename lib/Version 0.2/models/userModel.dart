final String userModel = 'UserModel';

class userModelFields {
  static final List<String> values = [
    id, search_impression_share, search_exact_match_impression_share, search_rank_lost_impression_share, search_budget_lost_top_impression_share, search_budget_lost_top_impression_share, all_conversions_from_int_rate, datepulled, customername
  ];

  static final String id = '_id';
  static final String search_impression_share = 'search_impression_share';
  static final String search_exact_match_impression_share = 'search_exact_match_impression_share';
  static final String search_rank_lost_impression_share = 'search_rank_lost_impression_share';
  static final String search_budget_lost_top_impression_share = 'search_budget_lost_top_impression_share';
  static final String search_budget_lost_absolute_top_impression_share = 'search_budget_lost_absolute_top_impression_share';
  static final String all_conversions_from_int_rate = 'all_conversions_from_int_rate';
  static final String datepulled = 'datepulled';
  static final String customername = 'customername';
}

class UserModel {
  final int id;
  final double search_impression_share;
  final double search_exact_match_impression_share;
  final double search_rank_lost_impression_share;
  final double search_budget_lost_top_impression_share;
  final double search_budget_lost_absolute_top_impression_share;
  final double all_conversions_from_int_rate;
  final String datepulled;
  final String customername;

  UserModel({
    this.id,
    this.search_impression_share,
    this.search_exact_match_impression_share,
    this.search_rank_lost_impression_share,
    this.search_budget_lost_top_impression_share,
    this.search_budget_lost_absolute_top_impression_share,
    this.all_conversions_from_int_rate,
    this.datepulled,
    this.customername,
  });

  UserModel copy({
    int id,
    double search_impression_share,
    double search_exact_match_impression_share,
    double search_rank_lost_impression_share,
    double search_budget_lost_top_impression_share,
    double search_budget_lost_absolute_top_impression_share,
    double all_conversions_from_int_rate,
    String datepulled,
    String customername,
  }) => UserModel(
    id: id ?? this.id,
    search_impression_share: search_impression_share ?? this.search_impression_share,
    search_exact_match_impression_share: search_exact_match_impression_share ?? this.search_exact_match_impression_share,
    search_rank_lost_impression_share: search_rank_lost_impression_share ?? this.search_rank_lost_impression_share,
    search_budget_lost_top_impression_share: search_budget_lost_top_impression_share ?? this.search_budget_lost_top_impression_share,
    search_budget_lost_absolute_top_impression_share: search_budget_lost_absolute_top_impression_share ?? this.search_budget_lost_absolute_top_impression_share,
    all_conversions_from_int_rate: all_conversions_from_int_rate ?? this.all_conversions_from_int_rate,
    datepulled: datepulled ?? this.datepulled,
    customername: customername ?? this.customername,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'search_impression_share': search_impression_share,
      'search_exact_match_impression_share': search_exact_match_impression_share,
      'search_rank_lost_impression_share': search_rank_lost_impression_share,
      'search_budget_lost_top_impression_share': search_budget_lost_top_impression_share,
      'search_budget_lost_absolute_top_impression_share': search_budget_lost_absolute_top_impression_share,
      'all_conversions_from_int_rate': all_conversions_from_int_rate,
      'datepulled': datepulled,
      'customername': customername,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      search_impression_share: map['search_impression_share'],
      search_exact_match_impression_share: map['search_exact_match_impression_share'],
      search_rank_lost_impression_share: map['search_rank_lost_impression_share'],
      search_budget_lost_top_impression_share: map['search_budget_lost_top_impression_share'],
      search_budget_lost_absolute_top_impression_share: map['search_budget_lost_absolute_top_impression_share'],
      all_conversions_from_int_rate: map['all_conversions_from_int_rate'],
      datepulled: map['datepulled'],
      customername: map['customername'],
    );
  }

  Map<String, dynamic> toMapNew() {
    return {
      'id': 0,
      'search_impression_share': search_impression_share,
      'search_exact_match_impression_share': search_exact_match_impression_share,
      'search_rank_lost_impression_share': search_rank_lost_impression_share,
      'search_budget_lost_top_impression_share': search_budget_lost_top_impression_share,
      'search_budget_lost_absolute_top_impression_share': search_budget_lost_absolute_top_impression_share,
      'all_conversions_from_int_rate': all_conversions_from_int_rate,
      'datepulled': datepulled,
      'customername': customername,
    };
  }

  factory UserModel.fromMapNew(Map<String, dynamic> map) {
    return UserModel(
      id: 0,
      search_impression_share: map['search_impression_share'],
      search_exact_match_impression_share: map['search_exact_match_impression_share'],
      search_rank_lost_impression_share: map['search_rank_lost_impression_share'],
      search_budget_lost_top_impression_share: map['search_budget_lost_top_impression_share'],
      search_budget_lost_absolute_top_impression_share: map['search_budget_lost_absolute_top_impression_share'],
      all_conversions_from_int_rate: map['all_conversions_from_int_rate'],
      datepulled: map['datepulled'],
      customername: map['customername'],
    );
  }
}

class Kard {
  String title;
  String detail;
  Kard({this.title, this.detail});
}

final search_impression_share = Kard(
  title: 'search impression share',
  detail: '14.7'
);

final search_exact_match_impression_share = Kard(
    title: 'search exact match impression share',
    detail: '6.1'
);

final search_rank_lost_impression_share = Kard(
    title: 'search rank lost impression share',
    detail: '9.8'
);

final search_budget_lost_top_impression_share = Kard(
    title: 'search budget lost top impression share',
    detail: '17.8'
);

final search_budget_lost_absolute_top_impression_share = Kard(
    title: 'search budget lost absolute top impression share',
    detail: '14.3'
);

final all_conversions_from_int_rate = Kard(
    title: 'all conversions from int rate',
    detail: '3.9'
);

List<Kard> kards = [
  search_impression_share,
  search_exact_match_impression_share,
  search_rank_lost_impression_share,
  search_budget_lost_top_impression_share,
  search_budget_lost_absolute_top_impression_share,
  all_conversions_from_int_rate
];