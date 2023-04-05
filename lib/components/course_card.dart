import 'components.dart';
import '../Resources/resources.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).r,
      height: 240.h,
      width: 230.w,
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: BorderRadius.circular(20).w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorManager.white, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
                  child: Text(
                    course.description,
                    style: TextStyle(color: ColorManager.white70),
                  ),
                ),
                Text(
                  '61 SECTION - 11 HOURS',
                  style: TextStyle(color: ColorManager.white54),
                ),
                const Spacer(),
                Row(
                  children: List.generate(
                    3,
                    (index) => Transform.translate(
                      offset: Offset((-10 * index).toDouble(), 0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/avatars/Avatar ${index + 1}.jpg'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(course.iconsrc),
        ],
      ),
    );
  }
}
