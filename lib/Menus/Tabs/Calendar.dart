import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calendar"), centerTitle: true),
      body: Column(
        children: [
          _buildHeader(),
          _buildWeekdays(),
          Expanded(
            child: _buildMonthView(
              DateTime(selectedDate.year, selectedDate.month),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final monthLabel = DateFormat.yMMMM().format(selectedDate);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                selectedDate = DateTime(
                  selectedDate.year,
                  selectedDate.month - 1,
                  1,
                );
              });
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                monthLabel,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'inter',
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                selectedDate = DateTime(
                  selectedDate.year,
                  selectedDate.month + 1,
                  1,
                );
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeekdays() {
    const weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return Row(
      children:
          weekdays
              .map(
                (day) => Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'inter',
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildMonthView(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final firstWeekday = firstDay.weekday; // Monday=1 ... Sunday=7

    final totalCells = ((firstWeekday - 1 + daysInMonth + 6) ~/ 7) * 7;

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
      ),
      itemCount: totalCells,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final dayNum = index - (firstWeekday - 1) + 1;
        if (dayNum < 1 || dayNum > daysInMonth) {
          return const SizedBox.shrink();
        }
        final date = DateTime(month.year, month.month, dayNum);
        final isSelected = _isSameDay(date, selectedDate);
        final isToday = _isSameDay(date, DateTime.now());

        return GestureDetector(
          onTap: () => setState(() => selectedDate = date),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected ? Colors.green : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border:
                  isToday && !isSelected
                      ? Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.5,
                      )
                      : null,
            ),
            child: Center(
              child: Text(
                "$dayNum",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color:
                      isSelected
                          ? Colors.white
                          : Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
