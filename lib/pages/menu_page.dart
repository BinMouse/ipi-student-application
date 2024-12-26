import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconLabelPair {
  final IconData iconData;
  final String label;

  IconLabelPair (this.iconData, this.label);
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  List<IconLabelPair> _iconsList = [
    IconLabelPair(Icons.info, "О приложении"),
    IconLabelPair(Icons.people_alt, "Преподаватели"),
    IconLabelPair(Icons.info_outline, "О кафедре"),
    IconLabelPair(Icons.web, "Сайт ИиПИ"),
    IconLabelPair(Icons.list_alt, "Расписание"),
    IconLabelPair(Icons.abc_sharp, "И ещё"),
    IconLabelPair(Icons.add, "И ещё"),
    IconLabelPair(Icons.account_tree, "И ещё"),
    IconLabelPair(Icons.adb_sharp, "И ещё"),
    IconLabelPair(Icons.add_call, "И ещё")
  ];

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: _iconsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(4),
            child: ElevatedButton(
              onPressed: (){},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Center(
                        child: Icon(_iconsList[index].iconData, size: 70, color: Colors.blue,),
                      ),
                  ),
  
                  Text(_iconsList[index].label,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
  
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[50],
                padding: const EdgeInsets.fromLTRB(0,0,0,8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
        }
    );
  }
}
