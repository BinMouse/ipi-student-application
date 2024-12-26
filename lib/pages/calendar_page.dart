import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ipi_app/primitives/calendar_event.dart';


class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  //region Переменные

  final CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  final DateTime _firstDay =  DateTime.utc(2024);

  final DateTime _lastDay =  DateTime.utc(2050);

  final Radius _borderRadius = const Radius.circular(12);

  String _month = '';

  Map <DateTime, List<CalendarEvent>> _events = {};

  static const _months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Окрябрь',
    'Ноябрь',
    'Декабрь',
  ];

  //endregion Переменные

  //region Методы
  List<CalendarEvent> _getEventsForDay( DateTime day ) {
    return _events[day] ?? [];
  }
  //endregion Методы

  //region Переопределения

  // Инициализация
  @override
  void initState() {
    super.initState();

    // инициализация строки-месяца
    _month = '${_months[DateTime.now().month - 1]}, ${DateTime.now().year}';

    // тестовая инициализация календарных событий

    _events[DateTime.utc(2024,12,31)] = [
      CalendarEvent('Предновоговогодняя суета', TimeOfDay(hour: 20, minute: 00)),
      CalendarEvent('Новый Год по МСК', TimeOfDay(hour: 23, minute: 00)),
    ];

    _events[DateTime.utc(2025,1,1)] = [
      CalendarEvent('Новый Год', TimeOfDay(hour: 0, minute: 00)),
    ];

    _events[DateTime.utc(2024,7,10)] = [
      CalendarEvent('Начало работы над приложением', TimeOfDay(hour: 11, minute: 00)),
    ];
  }

  // Билдер
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Calendar
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      _month,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w300,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  TableCalendar(
                    headerVisible: false,
                    firstDay: _firstDay,
                    lastDay: _lastDay,
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    daysOfWeekHeight: 24.0,
                    locale: 'ru_RU',

                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },

                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },

                    onPageChanged: (focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                        _month = '${_months[focusedDay.month - 1]}, ${focusedDay.year}';
                      });
                    },

                    eventLoader: _getEventsForDay,

                    // Styles

                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: const TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                      weekendStyle: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w300,
                        color: Colors.blue[700],
                        fontSize: 20,
                      ),
                    ),

                    calendarStyle: CalendarStyle(
                      // Выбранный день
                      selectedDecoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle, // Оставляем круг, убираем borderRadius
                      ),

                      // Сегодняшний день
                      todayDecoration: BoxDecoration(
                        color: Colors.lightBlue[100],
                        shape: BoxShape.circle, // Аналогично убираем borderRadius
                      ),

                      defaultTextStyle: const TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),

                      todayTextStyle: const TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.black,
                      ),

                      selectedTextStyle: const TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white,
                      ),

                      outsideTextStyle: const TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: Colors.grey,
                      ),

                      holidayTextStyle: const TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.redAccent,
                      ),

                      weekendTextStyle: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.blue[700],
                      ),
                    ),

                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          // События
          Expanded (
            child: ListView.builder(
              itemCount: _getEventsForDay(_selectedDay ?? _focusedDay).length,
              itemBuilder: (context, index) {
                final event = _getEventsForDay(_selectedDay ?? _focusedDay)[index];
                return Card (
                  color: Colors.blue[50],
                  shadowColor: Colors.transparent,

                  child: ListTile(

                    title: Text(event.title, style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.black,
                    ),),

                    trailing: Text(
                      event.time.format(context),
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),

                    onTap: () {
                      // Handle event tap
                      debugPrint('Tapped on $event');
                    },
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
  //endregion Переопределения
}
