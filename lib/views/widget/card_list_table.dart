import 'package:flutter/material.dart';

class CardListtable extends StatelessWidget {
  final int no;
  final Function(int) onClick;
  final int currIndex;
  final int index;
  const CardListtable(
      {Key? key,
      required this.no,
      required this.onClick,
      required this.currIndex,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick(no);
      },
      child: Card(
        color: currIndex != no ? Colors.white : Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        child: Center(
          child: Text(no.toString()),
        ),
      ),
    );
  }
}
