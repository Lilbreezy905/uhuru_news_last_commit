import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key, required this.description, required this.url});
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            LinearProgressIndicator(
              value: progress
                  .toDouble(), // Set the progress value (between 0.0 and 1.0)
              backgroundColor: Colors.white,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 56, 33, 160)),
            );
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            errorPage();
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(
        title: Text(description),
      ),
      body: WebViewWidget(controller: controller),
    );
  }

  Widget errorPage() {
    return const Center(
      child: Text("Page not found"),
    );
  }
}
