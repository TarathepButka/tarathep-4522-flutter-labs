class Score {
  int? id;
  int? score;

  Score({this.id, this.score});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'score': score,
    };
  }

  static Score fromMap(Map<String, dynamic> map) {
    return Score(
      id: map['id'],
      score: map['score'],
    );
  }
}
