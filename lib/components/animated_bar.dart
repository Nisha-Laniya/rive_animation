import 'components.dart';
import '../Resources/resources.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 4.h,
      width: isActive ? 20.w : 0.w,
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12).w,
          color: ColorManager.lightBlue
      ),
    );
  }
}