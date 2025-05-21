class AlbumModel {
  final int id;
  final String title;

  AlbumModel({required this.id, required this.title});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'],
      title: json['title'],
    );
  }
}