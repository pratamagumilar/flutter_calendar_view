import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../pages/event_details_page.dart';

class WeekViewWidget extends StatelessWidget {
  final GlobalKey<WeekViewState>? state;
  final double? width;

  const WeekViewWidget({super.key, this.state, this.width});

  @override
  Widget build(BuildContext context) {
    return WeekView(
      key: state,
      timeLineWidth: 70,
      width: 1100,
      showWeekends: true,
      showLiveTimeLineInAllDays: true,
      eventArranger: SideEventArranger(maxWidth: 30),
      
      pageViewPhysics: const NeverScrollableScrollPhysics(),
      scrollPhysics: const BouncingScrollPhysics(),
      liveTimeIndicatorSettings: LiveTimeIndicatorSettings(
        color: Colors.redAccent,
        showTime: true,
      ),
      onTimestampTap: (date) {
        SnackBar snackBar = SnackBar(
          content: Text("On tap: ${date.hour} Hr : ${date.minute} Min"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      fullDayEventBuilder: (events,data){
        return SizedBox.shrink();
      },
      onEventTap: (events, date) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailsPage(
              event: events.first,
              date: date,
            ),
          ),
        );
      },
      onEventLongTap: (events, date) {
        SnackBar snackBar = SnackBar(content: Text("on LongTap"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      timeLineOffset: 0,
    );
  }
}
