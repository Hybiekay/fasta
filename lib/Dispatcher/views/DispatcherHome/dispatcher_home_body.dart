import 'request-card.dart';
import 'package:get/get.dart';
import '../../../controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherdrawer/drawer.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/Dis_Request_card.dart';

class DispatcherHomeBody extends StatefulWidget {
  const DispatcherHomeBody({super.key});

  @override
  State<DispatcherHomeBody> createState() => _DispatcherHomeBodyState();
}

class _DispatcherHomeBodyState extends State<DispatcherHomeBody> {
  DriverController driverController = Get.put(DriverController());
  bool isrequested = false;

  @override
  void initState() {
    super.initState();
    requs();
  }

//Texting pupose the Screen need to wait for 5seconds before moving to another screen if not the Screen is going to crash
  requs() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isrequested = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width.w,
          height: MediaQuery.of(context).size.height * 0.32,
          color: AppColor.whiteColor,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const DispatcherDrawerScreen());
                      //   Navigator.of(context)
                      //       .pushNamed(DispatcherDrawerScreen.routeName);
                    },
                    child: Image.asset(
                      AppImages.menuBar,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Your Dispatch Request',
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Get it delivered in the time it takes to drive there!',
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
        Expanded(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.68.h,
              color: AppColor.mainColor,
              child: FutureBuilder(
                  future: driverController.getAllRequest(),
                  // initialData:
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    print(snapshot.data);
                    return Container();
                  })
              //   return NodataCard(content: "You have no request \nyet!");
              // } else if (snapshot.hasError) {
              //   return NodataCard(
              //       content: "Request Is Loading  \nCheck you Connetion!");
              // }

              // return ListView.builder(
              //   itemCount: snapshot.data.length,
              //   itemBuilder: (context, index) {
              //     return RequestCard(
              //       name: 'Opeyemi Akinyemi',
              //       distance: '15.2 km',
              //       price: '₦20,005.00',
              //       time: "82",
              //     );
              //   },
              // );
              // }),
              // child: SingleChildScrollView(
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         height: 20.h,
              //       ),
              //       Container(
              //         width: MediaQuery.of(context).size.width.w,
              //         color: AppColor.mainColor,
              //         child: isrequested
              //             ? dispatcherRequsetCard()
              //             : Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: [
              //                   SizedBox(
              //                     height: 25.h,
              //                   ),
              //                   Image.asset(
              //                     AppImages.homePageImage,
              //                     width: 300.w,
              //                     height: 158.h,
              //                     filterQuality: FilterQuality.high,
              //                   ),
              //                   SizedBox(
              //                     height: 25.h,
              //                   ),
              //                   Padding(
              //                       padding: const EdgeInsets.symmetric(
              //                           vertical: 30, horizontal: 30),
              //                       child: Text(
              //                         "You have no request \nyet!",
              //                         textAlign: TextAlign.center,
              //                         style: GoogleFonts.dmSans(
              //                           fontSize: 30,
              //                           color: AppColor.whiteColor,
              //                           fontWeight: FontWeight.w700,
              //                         ),
              //                       ))
              //                 ],
              //               ),
              //       ),
              //     ],
              //   ),
              // ),
              ),
        )
      ],
    );
  }
}
