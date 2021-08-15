import 'package:applify/Version 0.2/db/new-db.dart';

final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    id, search_impression_share, search_exact_match_impression_share, search_rank_lost_impression_share, search_budget_lost_top_impression_share, search_budget_lost_top_impression_share, all_conversions_from_int_rate, datepulled, customername
  ];

  static final String id = 'id';
  static final String search_impression_share = 'search_impression_share';
  static final String search_exact_match_impression_share = 'search_exact_match_impression_share';
  static final String search_rank_lost_impression_share = 'search_rank_lost_impression_share';
  static final String search_budget_lost_top_impression_share = 'search_budget_lost_top_impression_share';
  static final String search_budget_lost_absolute_top_impression_share = 'search_budget_lost_absolute_top_impression_share';
  static final String all_conversions_from_int_rate = 'all_conversions_from_int_rate';
  static final String datepulled = 'datepulled';
  static final String customername = 'customername';
}

class Note {
  final int id;
  final double search_impression_share;
  final double search_exact_match_impression_share;
  final double search_rank_lost_impression_share;
  final double search_budget_lost_top_impression_share;
  final double search_budget_lost_absolute_top_impression_share;
  final double all_conversions_from_int_rate;
  final String datepulled;
  final String customername;

  const Note({
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

  Note copy({
    int id,
    double search_impression_share,
    double search_exact_match_impression_share,
    double search_rank_lost_impression_share,
    double search_budget_lost_top_impression_share,
    double search_budget_lost_absolute_top_impression_share,
    double all_conversions_from_int_rate,
    String datepulled,
    String customername,
  }) =>
      Note(
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

  static Note fromJson(Map<String, Object> json) => Note(
    id: json[NoteFields.id] as int,
    search_impression_share: json[NoteFields.search_impression_share] as double,
    search_exact_match_impression_share: json[NoteFields.search_exact_match_impression_share] as double,
    search_rank_lost_impression_share: json[NoteFields.search_rank_lost_impression_share] as double,
    search_budget_lost_top_impression_share: json[NoteFields.search_budget_lost_top_impression_share] as double,
    search_budget_lost_absolute_top_impression_share: json[NoteFields.search_budget_lost_absolute_top_impression_share] as double,
    all_conversions_from_int_rate: json[NoteFields.all_conversions_from_int_rate] as double,
    datepulled: json[NoteFields.datepulled] as String,
    customername: json[NoteFields.customername] as String,
  );

  static Note fromJsonNew(Map<String, Object> json, int id) => Note(
    id: id,
    search_impression_share: json[NoteFields.search_impression_share] as double,
    search_exact_match_impression_share: json[NoteFields.search_exact_match_impression_share] as double,
    search_rank_lost_impression_share: json[NoteFields.search_rank_lost_impression_share] as double,
    search_budget_lost_top_impression_share: json[NoteFields.search_budget_lost_top_impression_share] as double,
    search_budget_lost_absolute_top_impression_share: json[NoteFields.search_budget_lost_absolute_top_impression_share] as double,
    all_conversions_from_int_rate: json[NoteFields.all_conversions_from_int_rate] as double,
    datepulled: json[NoteFields.datepulled] as String,
    customername: json[NoteFields.customername] as String,
  );

  Map<String, Object> toJson() => {
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

deployKards() {
  List singleDict = NotesDatabase.instance.readAllNotes() as List;
  search_impression_share.detail = singleDict[0]['search_impression_share'];
  search_exact_match_impression_share.detail = singleDict[0]['search_exact_match_impression_share'];
  search_rank_lost_impression_share.detail = singleDict[0]['search_rank_lost_impression_share'];
  search_budget_lost_top_impression_share.detail = singleDict[0]['search_budget_lost_top_impression_share'];
  search_budget_lost_absolute_top_impression_share.detail = singleDict[0]['search_budget_lost_absolute_top_impression_share'];
  all_conversions_from_int_rate.detail = singleDict[0]['all_conversions_from_int_rate'];
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