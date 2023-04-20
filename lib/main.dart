import 'package:get/get.dart';
import 'views/onBoardScreen/choiceScreen.dart';
import 'package:ziklogistics/routes/routes.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: "fasta_key",
        channelName: "Fasta",
        channelDescription: "Fasta Notification",
        defaultColor: AppColor.mainColor,
        ledColor: AppColor.whiteColor,
        channelShowBadge: true,
        playSound: true,
        importance: NotificationImportance.High)
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // late final DriverApiController _apiController;

    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Fasta',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(),
            initialRoute: ChoiceScreen.routeName,
            routes: routes,
            //home: ChatScreen()
            //MyWidget()
            //     // CostomerHome()
            //     DispatcherHome()
            // // DRegisterScreen(phoneNum: ""),
          );
        });
  }
}
