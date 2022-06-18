import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/models/responsive_size.dart';
import 'package:flutter/material.dart';

class CreateTable {
  final List val;
  Color? color;

  CreateTable(this.val, this.color);
  List<TableRow> createTable() {
    List valList = val;
    List<TableRow> list = [];
    while (valList.isNotEmpty) {
      if (valList.length > 1) {
        list.add(
          TableRow(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: getProportionalScreenHeigth(5),
                        right: getProportionalScreenWidth(5)),
                    child: Icon(
                      Icons.circle,
                      size: 15,
                      color: color ?? black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      valList.sublist(0, 2)[0],
                      style: detailText2style,
                      softWrap: true,
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: getProportionalScreenHeigth(5),
                        right: getProportionalScreenWidth(5)),
                    child: Icon(
                      Icons.circle,
                      size: 15,
                      color: color ?? black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      valList.sublist(0, 2)[0],
                      style: detailText2style,
                      softWrap: true,
                    ),
                  )
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: getProportionalScreenHeigth(5),
                      right: getProportionalScreenWidth(5)),
                  child: Icon(
                    Icons.circle,
                    size: 15,
                    color: color ?? black,
                  ),
                ),
                Expanded(
                    child: Text(valList[0],
                        softWrap: true, style: detailText2style)),
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
}
