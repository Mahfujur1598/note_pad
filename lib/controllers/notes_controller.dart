import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_pad/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesController extends GetxController {
  var notes = <NoteModel>[].obs;

  final box = GetStorage();

  saveNotes() async {

    //Example of Get Storage
    final jsonList = notes.map((note) => note.toJson()).toList();

    box.write('notes', jsonList);

    //Example of Shared Preferences
    //  final prefs = await SharedPreferences.getInstance();
    //  final jsonList = notes.map((note) => note.toJson()).toList();
    // final jsonString = jsonEncode(jsonList);

    //  prefs.setString('notes', jsonString);
  }

  loadNots() async {

    final jsonList = box.read<List>('notes');

    if(jsonList != null){

      final notesObjList = jsonList.map((json) => NoteModel.fromJson(json)).toList();

      notes.addAll(notesObjList);

      update();
    }





    //final prefs = await SharedPreferences.getInstance();

    //final jsonString = prefs.getString('notes');

    //if(jsonString != null){
    //  final jsonList = jsonDecode(jsonString) as List;

    //  final objList = jsonList.map((json) => NoteModel.fromJson(json)).toList();

    //  notes.value = objList;

    //  update();

    // }
  }

  createNote(String title, String description) {
    notes.add(
      NoteModel(
        title: title.isEmpty ? null : title,
        description: description,
        createdAt: DateTime.now().toString(),
      ),
    );

    update();

    saveNotes();

    Get.back();
  }

  updateNote(int index, NoteModel note) {
    notes[index] = note;
    update();

    saveNotes();

    Get.back();
  }

  deleteNote(int index) {
    notes.removeAt(index);

    saveNotes();
  }

  @override
  void onInit() {
    super.onInit();
    loadNots();
  }
}
