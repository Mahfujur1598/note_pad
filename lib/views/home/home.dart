import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_pad/controllers/home_controllers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        scrolledUnderElevation: 0,
        title: const Text('Notepad', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              // Toggle view type
              homeController.isGrid.value = !homeController.isGrid.value;
            },
            icon: const Icon(Icons.grid_on_outlined),
            color: Colors.white,
          ),
        ],
      ),

      body: Obx(() {
        if (homeController.isGrid.value) {
          return const Center(
            child: Text('Grid View', style: TextStyle(color: Colors.amber)),
          );
        } else {
          return ListView.separated(
            itemBuilder: (_, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Text(
                    'Mahfuj',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '8:09 AM',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            padding: const EdgeInsets.all(8),
            itemCount: 10,
          );
        }
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white60),
      ),
    );
  }
}
