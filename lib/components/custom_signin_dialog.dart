import 'components.dart';
import '../Resources/resources.dart';

Future<Object?> customSignInDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: 'Sign In',
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      pageBuilder: (context, _, __) {
        return Center(
          child: Container(
            height: 500.h,
            margin: const EdgeInsets.symmetric(horizontal: 16).r,
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24).r,
            decoration: BoxDecoration(
              color: ColorManager.white.withOpacity(0.94),
              borderRadius: BorderRadius.circular(40).w,
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(fontSize: 34.sp, fontFamily: 'Poppins'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16).r,
                          child: const Text(
                            'Access to 240+ hours of content. Learn design and code, by building real apps wuth Flutter and Swift.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SignInForm(),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16).r,
                              child: Text(
                                'OR',
                                style: TextStyle(color: ColorManager.black26),
                              ),
                            ),
                            const Expanded(
                              child: Divider(),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24).r,
                          child: Text(
                            'Sign up with Email, Apple or Google',
                            style: TextStyle(color: ColorManager.black54),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/email_box.svg',
                                height: 64.h,
                                width: 64.w,
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/apple_box.svg',
                                height: 64.h,
                                width: 64.w,
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/google_box.svg',
                                height: 64.h,
                                width: 64.w,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).then(onClosed);
}