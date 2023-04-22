import 'dart:developer';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'views/onBoardScreen/choiceScreen.dart';
import 'package:ziklogistics/routes/routes.dart';
import 'package:ziklogistics/views/home/home.dart';
import 'package:ziklogistics/models/driver_model.dart';
import 'package:ziklogistics/models/customers_model.dart';
import 'package:ziklogistics/views/auth/login_screen.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/controllers/global_token.dart';
import 'package:ziklogistics/notification/notification.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/home.dart';
import 'package:ziklogistics/components/Widget/on_boad_page_selection.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/login_screen.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  getRoute() async {
    var globalToken = await GlobalStorage.getToken();
    if (globalToken != null) {
      bool hasExpired = JwtDecoder.isExpired(globalToken);
      if (!hasExpired) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(globalToken);
        log(decodedToken.toString());

        if (decodedToken["role"] == "driver") {
          var allData = await DStorage.getDriverData();
          if (allData != null) {
            log('Secure storage has data: $allData');

            driverData = allData;

            if (DriverUserModel.name == null && DriverUserModel.bvn == null) {
              Get.to(() => const DispatcherLoginScreen());
            } else if (DriverUserModel.nin != null &&
                DriverUserModel.name != null &&
                DriverUserModel.bvn != null) {
              Get.offAll(() => const DispatcherHome());
            }
          } else {
            log('Secure storage is empty');
            Get.offAll(() => const DispatcherOnBoardPages());
          }
        } else if (decodedToken["role"] == "customer") {
          var yourToken = await Storage.getToken();
          if (yourToken != null) {
            Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
            log(decodedToken.toString());

            Notify.sendNotice(
                title: "Welcome", body: "Wecome to Fasta Logistic App ");

            custormerData = await Storage.getData();
            if (custormerData != null) {
              log('Secure storage has data: is not null $custormerData');

              if (CustomersUserModel.name != null &&
                  CustomersUserModel.email != null) {
                Get.to(() => const CostomerHome());
              } else {
                Get.to(() => const LoginScreen());
              }
            } else {
              Get.to(() => const LoginScreen());
            }
          }
        }
      } else {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(globalToken);
        log(decodedToken.toString());
        log("is expired ${decodedToken.toString()} is expired  ");
        if (decodedToken["role"] == "driver") {
          Get.to(() => const DispatcherLoginScreen());
        }
        Get.to(() => const LoginScreen());
      }
    } else {
      log("you Have not Login");
      Get.to(() => ChoiceScreen());
    }
  }

  @override
  void initState() {
    getRoute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // late final DriverApiController _apiController;

    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            color: AppColor.mainColor,
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
