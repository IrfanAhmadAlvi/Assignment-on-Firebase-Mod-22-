class MatchModel {
  final String id;
  final String home;
  final String away;
  final int homeGoals;
  final int awayGoals;
  final int runningSecs;
  final int totalSecs;

  MatchModel({
    required this.id,
    required this.home,
    required this.away,
    required this.homeGoals,
    required this.awayGoals,
    required this.runningSecs,
    required this.totalSecs,
  });

  factory MatchModel.fromMap(String id, Map<String, dynamic> data) {
    return MatchModel(
      id: id,
      home: data['home'] ?? '',
      away: data['away'] ?? '',
      homeGoals: (data['homeGoals'] ?? 0) as int,
      awayGoals: (data['awayGoals'] ?? 0) as int,
      runningSecs: (data['runningSecs'] ?? 0) as int,
      totalSecs: (data['totalSecs'] ?? 5400) as int,
    );
  }
}
