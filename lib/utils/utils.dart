import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:flutter/material.dart';

List<TableRow> createTable(List val, Color? color) {
  List valList = val;
  List<TableRow> list = [];
  while (valList.isNotEmpty) {
    if (valList.length > 1) {
      list.add(
        TableRow(
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 15,
                  color: color ?? black,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(valList.sublist(0, 2)[0])
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 15,
                  color: color ?? black,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(valList.sublist(0, 2)[0])
              ],
            ),
          ],
        ),
      );
      valList.removeRange(0, 2);
    } else {
      list.add(TableRow(
        children: [
          Row(
            children: [
              Icon(
                Icons.circle,
                size: 15,
                color: color ?? black,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(valList[0]),
            ],
          ),
          const Text("")
        ],
      ));
      valList = [];
    }
  }
  return list;
}
