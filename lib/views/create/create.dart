import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/notes_controller.dart';

class NoteCreateView extends StatelessWidget {
  const NoteCreateView({super.key});

  @override
  Widget build(BuildContext context) {

    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    var controller = Get.put(NotesController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text('Create Note'),
        actions: [IconButton(onPressed: () {
          controller.createNote(
              titleController.text,
              descriptionController.text
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
