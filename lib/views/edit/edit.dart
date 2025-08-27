import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_pad/models/note_model.dart';

import '../../controllers/notes_controller.dart';

class NoteUpdateView extends StatelessWidget {
  final NoteModel note;
  final int index;


  const NoteUpdateView({super.key, required this.note, required this.index});

  @override
  Widget build(BuildContext context) {

    final titleController = TextEditingController(
      text: note.title
    );
    final descriptionController = TextEditingController(
      text: note.description
    );

    var controller = Get.put(NotesController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text('Update Note'),
        actions: [IconButton(onPressed: () {
          controller.updateNote(
            index,
             NoteModel(
               title: titleController.text,
               description: descriptionController.text,
               createdAt: note.createdAt,
               updatedAt: DateTime.now().toString()
             )
          );

        }, icon: Icon(Icons.done))],
      ),
      body: Padding(padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: TextStyle(color: Colors.white,fontSize: 25),

              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title.....',
                  hintStyle: TextStyle(
                      color: Colors.white.withAlpha(60), fontSize: 25
                  )

              ),
            ),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(
                  color: Colors.white,
                ),

                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write some notes....',
                    hintStyle: TextStyle(color: Colors.white.withAlpha(60))
                ),

              ),
            )
          ],

        ),


      ),
    );
  }
}
