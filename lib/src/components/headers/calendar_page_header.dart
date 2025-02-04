// Copyright (c) 2021 Simform Solutions. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../style/header_style.dart';
import '../../typedefs.dart';

class CalendarPageHeader extends StatelessWidget {
  /// When user taps on right arrow.
  ///
  /// This will be ignored if right icon is provided in [headerStyle].
  final VoidCallback? onNextDay;

  /// Hide & show right icon
  final bool showNextIcon;

  /// When user taps on left arrow.
  ///
  /// This will be ignored if left icon is provided in [headerStyle].
  final VoidCallback? onPreviousDay;

  /// Hide & show left icon
  final bool showPreviousIcon;

  /// When user taps on title.
  ///
  /// This will be ignored if [titleBuilder] is provided.
  final AsyncCallback? onTitleTapped;

  /// Date of month/day.
  final DateTime date;

  /// Secondary date. This date will be used when we need to define a
  /// range of dates.
  /// [date] can be starting date and [secondaryDate] can be end date.
  ///
  final DateTime? secondaryDate;

  /// Provides string to display as title.
  final StringProvider? dateStringBuilder;

  /// Builds the custom header title.
  ///
  /// This is useful when we need to add icon or something with the title.
  ///
  /// If [titleBuilder] is provided, [onTitleTapped] will be ignored.
  ///
  /// So, you need to handle the tap event manually if required.
  ///
  final WidgetBuilder? titleBuilder;

  // TODO: Need to remove after next major release
  /// background color of header.
  ///
  /// NOTE: This property is deprecated.
  /// Use [HeaderStyle.decoration] to provide colors to header.
  @Deprecated("Use HeaderStyle.decoration to provide background")
  final Color backgroundColor;

  // TODO: Need to remove after next major release
  /// Color of icons at both sides of header.
  ///
  /// NOTE: This property id deprecated. Use
  /// [HeaderStyle.leftIconConfig] or [HeaderStyle.rightIconConfig]
  /// to provide style to respective icons.
  ///
  @Deprecated("Use HeaderStyle to provide icon color")
  final Color? iconColor;

  /// Style for Calendar's header
  final HeaderStyle headerStyle;

  /// Common header for month and day view In this header user can define format
  /// in which date will be displayed by providing [dateStringBuilder] function.
  const CalendarPageHeader({
    Key? key,
    required this.date,
    this.dateStringBuilder,
    this.titleBuilder,
    this.onNextDay,
    this.showNextIcon = true,
    this.onTitleTapped,
    this.onPreviousDay,
    this.showPreviousIcon = true,
    this.secondaryDate,
    @Deprecated("Use HeaderStyle.decoration to provide background")
    this.backgroundColor = Constants.headerBackground,
    @Deprecated("Use HeaderStyle to provide icon color") this.iconColor,
    this.headerStyle = const HeaderStyle(),
  })  : assert(
            titleBuilder != null || dateStringBuilder != null,
            'titleBuilder and dateStringBuilder '
            'can not be null at the same time'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              dateStringBuilder != null ? dateStringBuilder!(date) : '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            OutlinedButton(
              onPressed: onPreviousDay,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(color: Color(0xffEAEAEA)),
                foregroundColor: Colors.grey,
              ),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Color(0xffA9A9A9),
              ),
            ),
            SizedBox(width: 8),
            OutlinedButton(
              onPressed: onNextDay,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(color: Color(0xffEAEAEA)),
                foregroundColor: Colors.grey,
              ),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xffA9A9A9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
