import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intent Launcher',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Intent Launcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  void _launchIntent() async {
    try {
      final intent = AndroidIntent(
        action: 'action_view',
        category: 'android.intent.category.BROWSABLE',
        data: _controller.text,
      );
      await intent.launch();
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade900,
          content: SizedBox(
            // ignore: use_build_context_synchronously
            height: MediaQuery.of(context).size.height / 3,
            child: Text(
              e.toString(),
              softWrap: false,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Enter the URL/data you want to launch:'),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'https://example.com/',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _launchIntent,
              child: const Text('Launch'),
            ),
          ],
        ),
      ),
    );
  }
}
