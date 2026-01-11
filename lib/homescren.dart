import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/AddNotescreen.dart';
import 'package:flutter_application_1/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescren extends StatefulWidget {
  Homescren({super.key});

  @override
  State<Homescren> createState() => _HomescrenState();
}

class _HomescrenState extends State<Homescren> {
  List<NotesModel> notes = [];

  @override
  void initState() {
    super.initState();
    _LodNotes();
  }

  void _LodNotes() async {
    final pref = await SharedPreferences.getInstance();
    final filNotes = pref.getString("notes");

    if (filNotes != null) {
      final notesDecode = jsonDecode(filNotes) as List<dynamic>;

      setState(() {
        notes = notesDecode
            .map((element) => NotesModel.fromJson(element))
            .toList();
      });
    }
  }

  void _deleteNote(int index) async {
    final pref = await SharedPreferences.getInstance();
    notes.removeAt(index);
    await pref.setString(
        "notes", jsonEncode(notes.map((e) => e.toJson()).toList()));
    setState(() {});
  }

  void _editNote(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Addnotescreen(
          noteToEdit: notes[index],
          index: index,
        ),
      ),
    );

    if (result == true) {
      _LodNotes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Addnotescreen();
                },
              ),
            ).then((_) => _LodNotes()); // إعادة تحميل بعد إضافة نوت جديد
          },
          backgroundColor:   Colors.cyan,
          foregroundColor: Color(0xff181818),
          child: Icon(Icons.add),
        ),
      ),
      backgroundColor: Color(0xff181818),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Notes",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.cyan,
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.all(8),
                //   child: Container(
                //     width: 35,
                //     height: 35,
                //     decoration: BoxDecoration(
                //       border: Border.all(color:Color(0xffffffff)),
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //     child: IconButton(
                //       onPressed: () {},
                //       icon: Icon(Icons.search),
                //     ),
                //   ),
                // ),
              ],
            ),
            Expanded(
              child: notes.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "No Notes Yet!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Add Now📝",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.cyan,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(8),
                      child: ListView.separated(
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff282828),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // النوت نفسه
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        notes[index].title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                        color: Colors.cyan,
                                        width: double.infinity,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        notes[index].content,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // أيقونات التعديل والحذف تحت بعض
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () => _editNote(index),
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.cyan,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () => _deleteNote(index),
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
