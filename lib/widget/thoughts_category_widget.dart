import 'package:flutter/material.dart';

class ThoughtsCategoryWidget extends StatelessWidget {
  ThoughtsCategoryWidget({super.key, required this.specials});
//task
//confirm if thare are objects

  @override
  final List<String> specials;
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: specials.length,
        itemBuilder: (context, index) {
          return Tooltip(
            showDuration: Duration(minutes: 1),
            message: '${specials[index]}',
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.cyanAccent,
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(7),
                  child: Text(
                    '${specials[index]}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
          );
        },
      ),
    );
  }
}
