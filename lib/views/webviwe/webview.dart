// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class WebView extends StatefulWidget {
//   final String url;

//   const WebView({Key? key, required this.url}) : super(key: key);

//   @override
//   State<WebView> createState() => _WebViewState();
// }

// class _WebViewState extends State<WebView> {
//   late InAppWebViewController webViewController;
//   double _progress = 0;


//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//            Expanded(
//               child: InAppWebView(
//                 initialUrlRequest: URLRequest(
//                   url: Uri.parse('https://www.fasta-smata.com/terms&condition'),
//                 ),
//                 onWebViewCreated:
//                     (InAppWebViewController inAppWebViewController) {
//                   webViewController = inAppWebViewController;
//                 },
//                 onProgressChanged:
//                     (InAppWebViewController inAppWebViewController, int prog) {
//                   setState(() {
//                     _progress = prog / 100;
//                   });
//                 },
//               ),
//             ),
          
//           ],
//         ),
//       ),
//     );
//   }
// }
