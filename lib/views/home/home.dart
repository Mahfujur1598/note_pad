import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_pad/controllers/home_controllers.dart';
import 'package:note_pad/controllers/notes_controller.dart';
import 'package:note_pad/views/auth/auth/login.dart';
import 'package:note_pad/views/create/create.dart';

import '../edit/edit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final noteController = Get.put(NotesController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        scrolledUnderElevation: 0,
        title: const Text('Notepad', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () => homeController.changeType(),
            icon: const Icon(Icons.grid_on_outlined),
            color: Colors.white,
          ),

          IconButton(
            onPressed: () {
              GetStorage().remove('token');
              Get.offAll(() => LoginView());
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),

      body: Obx(() {
        if (noteController.notes.isEmpty) {
          return Center(
            child: Text('No Data!', style: TextStyle(color: Colors.white)),
          );
        }

        if (homeController.isGrid.value) {
          return GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: noteController.notes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () => Get.to(
                  () => NoteUpdateView(
                    note: noteController.notes[index],
                    index: index,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        noteController.notes[index].title ?? 'Untitled',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Text(
                        noteController.notes[index].description ?? '',
                        style: TextStyle(color: Colors.white.withAlpha(80)),
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_filled_rounded,
                            color: Colors.white.withAlpha(80),
                            size: 16,
                          ),
                          SizedBox(width: 2),
                          Text(
                            noteController.notes[index].createdAt.toString(),
                            style: TextStyle(color: Colors.white.withAlpha(80)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return ListView.separated(
            itemBuilder: (_, index) {
              return Dismissible(
                key: UniqueKey(),

                onDismissed: (direction) {
                  noteController.deleteNote(index);

                },

                child: InkWell(
                  onTap: () => Get.to(
                    () => NoteUpdateView(
                      note: noteController.notes[index],
                      index: index,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        noteController.notes[index].title ?? 'Untitled',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(
                            Icons.access_time_filled_rounded,
                            color: Colors.white.withAlpha(80),
                            size: 16,
                          ),
                          SizedBox(width: 2),
                          Text(
                            noteController.notes[index].createdAt.toString(),
                            style: TextStyle(color: Colors.white.withAlpha(80)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            padding: const EdgeInsets.all(8),
            itemCount: noteController.notes.length,
          );
        }
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          Get.to(() => NoteCreateView());
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white60),
      ),
    );
  }
}



