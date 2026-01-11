// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';

// class NotesModel {

//   final String Title;
//   final String content;

//   NotesModel(this.Title,this.content);
// }
// Map<String,String>ToMap(){
// return {
//  "Title":Title,
//  "content":content;
// }
// }

// Factory NotesModel.fromjson(Map<String,String>jeson){
// return NotesModel ( 
// Title:jeson["Title"],
// content:jeson["content"],

// );

// }
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
