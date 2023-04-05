import 'screens/screens.dart';
import 'Resources/resources.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rive Animation',
          theme: ThemeData(
            scaffoldBackgroundColor: ColorManager.themeBgColor,
            fontFamily: "Intel",
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: ColorManager.white,
              errorStyle: const TextStyle(height: 0),
              border: defaultInputBorder,
              enabledBorder: defaultInputBorder,
              focusedBorder: defaultInputBorder,
              errorBorder: defaultInputBorder,
            ),
          ),
          home: const OnBoardingScreen(),
        );
      },
    );
  }
}
