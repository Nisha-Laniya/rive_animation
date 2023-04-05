import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';
import '../Resources/barrel_export.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;


  void signIn() {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (_formKey.currentState!.validate()) {
        //success animation
        check.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isShowLoading = false;
          });
          //after closing it confetti animation
          confetti.fire();
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EntryScreen(),
              ),
            );
          });
        });
      } else {
        //error animation
        error.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isShowLoading = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Email',
                  style: TextStyle(color: ColorManager.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16).r,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    onSaved: (password) {},
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8).r,
                        child: SvgPicture.asset('assets/icons/email.svg'),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Password',
                  style: TextStyle(color: ColorManager.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16).r,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    onSaved: (password) {},
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8).r,
                        child: SvgPicture.asset('assets/icons/password.svg'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 24).r,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      //when user tap tap the button it shows loading
                      signIn();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.buttonColor,
                        minimumSize: const Size(double.infinity, 56),
                        shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10).w,
                          topRight: const Radius.circular(25).w,
                          bottomRight: const Radius.circular(25).w,
                          bottomLeft: const Radius.circular(25).w,
                        ),),),
                    icon: Icon(
                      CupertinoIcons.arrow_right,
                      color: ColorManager.arrowColor,
                    ),
                    label: const Text('Sign In'),
                  ),
                ),
              ],
            )),
        //There is 3 trigger
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  'assets/RiveAssets/check.riv',
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard);
                    check = controller.findSMI('Check') as SMITrigger;
                    error = controller.findSMI('Error') as SMITrigger;
                    reset = controller.findSMI('Reset') as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                  scale: 7,
                  child: RiveAnimation.asset(
                    'assets/RiveAssets/confetti.riv',
                    onInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard);
                      confetti = controller.findSMI('Trigger explosion');
                    },
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({Key? key, required this.child, this.size = 100})
      : super(key: key);

  final Widget child;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(height: size, width: size, child: child),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
