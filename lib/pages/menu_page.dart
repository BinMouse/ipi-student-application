import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ipi_app/primitives/grid_menu_item.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  //region Переменные
  List<GridMenuItem> itemsList = [
    GridMenuItem(Icons.info, "О приложении", '/appinfo'),
    GridMenuItem(Icons.people_alt, "Преподаватели",),
    GridMenuItem(Icons.info_outline, "О кафедре",),
    GridMenuItem(Icons.web, "Сайт ИиПИ",),
    GridMenuItem(Icons.list_alt, "Расписание",),
    GridMenuItem(Icons.location_on_rounded, "Карта",),
    GridMenuItem(Icons.add_call, "Контакты",),
    GridMenuItem(Icons.settings, "Настройки",),
  ];
  //endregion Переменные

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(4),
            child: ElevatedButton(

              // Переход к новому экрану
              onPressed: (){
                try {
                  itemsList[index].goToRote(context);
                }
                catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Ошибка: Страница не найдена'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.blueGrey,
                    ),
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Center(
                        child: Icon(itemsList[index].iconData, size: 70, color: Colors.blue,),
                      ),
                  ),
  
                  Text(itemsList[index].label,
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

  //region Методы



  //endregion Методы
}
