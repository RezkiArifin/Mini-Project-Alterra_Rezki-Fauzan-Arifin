import 'package:flutter/material.dart';
import 'package:mini_project/styles/text_style.dart';
import 'package:mini_project/widgets/card_widget.dart';

import '../database/todo_db.dart';
import '../models/todo_model.dart';
import '../widgets/header_widget.dart';
import 'home_page.dart';

class ArchivePage extends StatefulWidget {
  final TodoModelDao dao;
  const ArchivePage({super.key, required this.dao});

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              child: HeaderWidget(
                columnCostume: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text('Archives', style: archiveTitleStyle),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height / 4.5,
              left: 16,
              child: Container(
                width: size.width - 32,
                height: size.height / 1.4,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                    right: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: StreamBuilder<List<TodoModel>>(
                    stream: widget.dao.findAllTodoArchiveAsStream(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();

                      final todo = snapshot.requireData;

                      return ListView.builder(
                        itemCount: todo.length,
                        itemBuilder: (context, index) {
                          return CardWidget(
                            todoModel: todo[index],
                            dao: widget.dao,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff2da9ef),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) {
                      return HomePage(
                        dao: widget.dao,
                      );
                    },
                  ),
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.list_alt_outlined,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.archive_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
