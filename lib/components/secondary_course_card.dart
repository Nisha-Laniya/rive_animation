import '../Resources/barrel_export.dart';

class SecondaryCourseCard extends StatelessWidget {
  const SecondaryCourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20).r,
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: BorderRadius.circular(20).r,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ColorManager.white, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Watch video - 15 mins',
                  style:
                  TextStyle(color: ColorManager.white60, fontSize: 16.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
            child: VerticalDivider(
              color: ColorManager.white70,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          SvgPicture.asset(course.iconsrc),
        ],
      ),
    );
  }
}