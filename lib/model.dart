
class NotesModel {
  final String title;
  final String content;

  NotesModel(this.title, this.content);

  /// convert object -> map
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "content": content,
    };
  }

  /// convert map -> object
  factory NotesModel.fromJson(Map<String, dynamic> json) {
    return NotesModel(
      json["title"],
      json["content"],
    );
  }
}
