class News {
  final int id;
  final String title;

  News({
    required this.id,
    required this.title,
  });

  factory News.fromJson(Map<String, dynamic> json){
    return News(
      id: json['id'],
      title: json['title'],
    );
  }
      
}
