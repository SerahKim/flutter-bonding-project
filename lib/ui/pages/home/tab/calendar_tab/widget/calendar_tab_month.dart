import 'package:bonding/ui/pages/%08home/tab/calendar_tab/widget/calendar_tab_meeting_data_source.dart';
import 'package:bonding/ui/pages/%08home/tab/calendar_tab/widget/calendar_tab_meeting.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarTabMonth extends StatefulWidget {
  @override
  _CalendarTabMonthState createState() => _CalendarTabMonthState();
}

class _CalendarTabMonthState extends State<CalendarTabMonth> {
  late List<Meeting> meetings;
  DateTime? selectedDate; // 선택된 날짜를 저장하는 변수

  @override
  void initState() {
    super.initState();
    meetings = getDataSource();
  }

  List<Meeting> getDataSource() {
    return [
      Meeting('General Meeting', DateTime(2025, 2, 12, 9, 0),
          DateTime(2025, 2, 12, 11, 0), Colors.green, false),
      Meeting('Scrum', DateTime(2025, 2, 12, 11, 0),
          DateTime(2025, 2, 12, 13, 0), Colors.blue, false),
      Meeting('Plan Execution', DateTime(2025, 2, 12, 12, 0),
          DateTime(2025, 2, 12, 14, 0), Colors.purple, false),
      Meeting('Support', DateTime(2025, 2, 12, 14, 0),
          DateTime(2025, 2, 12, 16, 0), Colors.red, false),
      Meeting('Development Meeting', DateTime(2025, 2, 12, 16, 0),
          DateTime(2025, 2, 12, 17, 0), Colors.orange, false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfCalendar(
            view: CalendarView.month,
            dataSource: MeetingDataSource(meetings),
            headerHeight: 0,
            todayHighlightColor: const Color.fromARGB(255, 85, 81, 255),
            monthViewSettings: MonthViewSettings(
              appointmentDisplayMode:
                  MonthAppointmentDisplayMode.appointment, // 제목 표시
              appointmentDisplayCount: 4,
              agendaStyle: AgendaStyle(
                appointmentTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            onTap: (CalendarTapDetails details) {
              if (details.targetElement == CalendarElement.calendarCell) {
                setState(
                  () {
                    selectedDate = details.date; // 선택된 날짜 업데이트
                  },
                );
                if (selectedDate != null) {
                  showAgendaBottomSheet(context, selectedDate!); // 모달 표시
                }
              }
            },
          ),
        ),
      ],
    );
  }

  // 모달 창에서 일정 보여주기
  void showAgendaBottomSheet(BuildContext context, DateTime selectedDate) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 모달이 화면의 80%까지 올라오도록 설정
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.8, // 처음 열릴 때 높이 (0.5 = 화면의 50%)
          minChildSize: 0.3, // 최소 높이
          maxChildSize: 0.8, // 최대 높이
          builder: (_, scrollController) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: FractionallySizedBox(
                      widthFactor: 0.25,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 12.0,
                        ),
                        child: Container(
                          height: 5.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2.5)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: buildAgendaList(selectedDate, scrollController),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // 선택된 날짜의 일정 리스트
  Widget buildAgendaList(DateTime selectedDate, ScrollController controller) {
    List<Meeting> selectedMeetings = meetings
        .where((meeting) =>
            meeting.from.year == selectedDate.year &&
            meeting.from.month == selectedDate.month &&
            meeting.from.day == selectedDate.day)
        .toList();

    if (selectedMeetings.isEmpty) {
      return Center(
        child: Text('일정이 없습니다.', style: TextStyle(fontSize: 16)),
      );
    }

    return ListView.builder(
      controller: controller, // DraggableScrollableSheet과 스크롤 연동
      itemCount: selectedMeetings.length,
      itemBuilder: (context, index) {
        final meeting = selectedMeetings[index];
        return Card(
          margin: EdgeInsets.all(8),
          color: meeting.background,
          child: ListTile(
            title:
                Text(meeting.eventName, style: TextStyle(color: Colors.white)),
            subtitle: Text('${meeting.from.hour}:00 - ${meeting.to.hour}:00',
                style: TextStyle(color: Colors.white70)),
          ),
        );
      },
    );
  }
}
