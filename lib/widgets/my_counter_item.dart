import 'package:flutter/material.dart';
import 'package:untitled/style/colors.dart';

class MyCounterItem extends StatefulWidget {
  MyCounterItem({
    Key? key,
    this.backgroundColor = secondColor,
    required this.title,
    required this.value,
  }) : super(key: key);

  final Color backgroundColor;
  final String title;
  int value;

  @override
  State<MyCounterItem> createState() => _MyCounterItemState();
}

class _MyCounterItemState extends State<MyCounterItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            Text(
              "${widget.value}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: IconButton(
                    onPressed: () {
                      if (widget.value == 1) return;
                      widget.value--;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: IconButton(
                    onPressed: () {
                      widget.value++;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
