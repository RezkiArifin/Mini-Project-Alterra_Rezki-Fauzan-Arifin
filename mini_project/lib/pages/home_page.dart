import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../styles/text_style.dart';
import '../widgets/form_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateFormat('dd/MMMM/yyyy').format(DateTime.now());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: size.width,
                height: size.height / 3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff8d70fe),
                      Color(0xff2da9ef),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Todo-List",
                      style: todoTitleStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListTile(
                      leading: Text(
                        now.split("/").first,
                        style: leadingTimeTextStyle,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          now.split('/')[1],
                          style: titleTimeTextStyle,
                        ),
                      ),
                      subtitle: Text(
                        now.split('/').last,
                        style: subtitleTimeTextStyle,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height / 4.5,
              left: 15,
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
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff2da9ef),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.list_alt_rounded),
              color: Colors.white,
              iconSize: 28,
            ),
            IconButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (_) {
                //       return const ArchivePage();
                //     },
                //   ),
                // );
              },
              icon: const Icon(Icons.archive_rounded),
              color: Colors.white,
              iconSize: 28,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return FormWidget(
                  //  addFunction: addTask,
                  );
            },
          );
        },
        backgroundColor: const Color(0xff2da9ef),
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          size: 36,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
