import '../Resources/resources.dart';
import 'package:flutter/material.dart';

class Course {
  final String title, description, iconsrc;
  final Color bgColor;

  Course({
    required this.title,
    this.description = 'Build and animate an iOS from scratch',
    this.iconsrc = 'assets/icons/ios.svg',
    this.bgColor = const Color(0xFF7553F6)
  });
}

List<Course> courses = [
  Course(title: 'Animation in SwiftUi'),
  Course(title: 'Animation in Flutter',iconsrc: 'assets/icons/code.svg',bgColor: ColorManager.lightBlue2)
];

List<Course> recentCourses = [
  Course(title: 'State Machine'),
  Course(title: 'Animated Menu', bgColor: ColorManager.lightBlue3,iconsrc: 'assets/icons/code.svg'),
  Course(title: 'Flutter with rive'),
  Course(title: 'Animated menu',bgColor: ColorManager.lightBlue3,iconsrc: 'assets/icons/code.svg'),
];