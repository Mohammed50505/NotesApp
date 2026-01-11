import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addnotescreen extends StatelessWidget {
  final NotesModel? noteToEdit; // لو جاي للتعديل هيمرر النوت هنا
  final int? index; // موقع النوت اللي هيتعدل

  const Addnotescreen({super.key, this.noteToEdit, this.index});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(
        text: noteToEdit != null ? noteToEdit!.content : '');
    TextEditingController controller2 = TextEditingController(
        text: noteToEdit != null ? noteToEdit!.title : '');

    GlobalKey<FormState> _key = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color(0xff181818),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff181818),
        title: Text(
            noteToEdit != null ? "Edit Notes" : "Add Notes",
            style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: controller2,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? false) {
                        return "Please Enter Title";
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Title",
                      prefixIcon: Icon(Icons.title),
                      filled: true,
                      fillColor: Color((0xff282828)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: 80),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: controller,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? false) {
                        return "Please Enter content";
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Content",
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.description),
                      filled: true,
                      fillColor: Color((0xff282828)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 120),
                ElevatedButton(
                  onPressed: () async {
                    NotesModel model = NotesModel(
                      controller2.text,
                      controller.text,
                    );
                    final pref = await SharedPreferences.getInstance();
                    final notsjson = pref.getString("notes");
                    List<NotesModel> listNote = [];
                    if (notsjson != null) {
                      final listNotes = jsonDecode(notsjson) as List<dynamic>;
                      listNote = listNotes
                          .map((element) => NotesModel.fromJson(element))
                          .toList();
                    }

                    if (_key.currentState?.validate() ?? false) {
                      if (noteToEdit != null && index != null) {
                        // تعديل النوت بدل الإضافة
                        listNote[index!] = model;
                      } else {
                        listNote.add(model);
                      }

                      final notesEncode = jsonEncode(
                        listNote.map((e) => e.toJson()).toList(),
                      );

                      await pref.setString("notes", notesEncode);
                       Navigator.of(context).pop(true);
                    
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: Size(310, 30),
                  ),
                  child: Text(noteToEdit != null ? "Save Changes" : "Add Notes"),
                ),
                SizedBox(height: 10),
                Text(
                  "✨ اذكر الله ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
