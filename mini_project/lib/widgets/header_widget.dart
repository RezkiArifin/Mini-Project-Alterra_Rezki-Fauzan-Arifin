import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final Column columnCostume;
  const HeaderWidget({
    super.key,
    required this.columnCostume,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
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
      child: columnCostume,
    );
  }
}
