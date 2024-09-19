import 'package:flutter/material.dart';

class HabitTrackerGrid extends StatefulWidget {
  @override
  _HabitTrackerGridState createState() => _HabitTrackerGridState();
}

class _HabitTrackerGridState extends State<HabitTrackerGrid> {
  final int daysInWeek = 7;
  final List<String> weekdays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  List<bool> habitCompletion = List.generate(365, (index) => false);
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToFirstHabitCompletion();
    });
  }

  void _scrollToFirstHabitCompletion() {
    int firstCompletedIndex = habitCompletion.indexWhere((completed) => completed);
    if (firstCompletedIndex != -1) {
      double position = (firstCompletedIndex / daysInWeek) * 60;
      _scrollController.animateTo(position, duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Months Row (Header)
        Container(
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.min, // Shrink-wrap the row
            children: months.map((month) {
              return Container(
                width: 60,
                child: Center(child: Text(month, style: TextStyle(fontWeight: FontWeight.bold))),
              );
            }).toList(),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Weekday column
              Column(
                children: weekdays.map((weekday) {
                  return Container(
                    height: 60,
                    width: 60,
                    child: Center(child: Text(weekday)),
                  );
                }).toList(),
              ),
              // Days grid
              SizedBox(
                height: 150,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                  ),
                  itemCount: 365,
                  itemBuilder: (context, index) {
                    DateTime currentDate = DateTime(DateTime.now().year, 1, 1).add(Duration(days: index));
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          habitCompletion[index] = !habitCompletion[index];
                        });
                      },
                      child: Container(
                        color: habitCompletion[index] ? Colors.green : Colors.grey,
                        child: Center(
                          child: Text('${currentDate.day}'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
