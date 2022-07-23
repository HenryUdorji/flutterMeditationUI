import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart' as colors;

void main() {
  runApp(const MyApp());
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: colors.Colors.backgroundColor,
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Lato',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        color: colors.Colors.backgroundColor,
        child: Column(
          children: const [
            TopSection(),
            SizedBox(height: 25,),
            WelcomeSection(),
          ],
        ),
      ),
    );
  }
}

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome Back, Harald!',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            'Ready to start your day?',
            style: TextStyle(
              color: colors.Colors.secondaryTextColor,
                fontWeight: FontWeight.normal,
                fontSize: 15),
          ),
          const SizedBox(height: 35,),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: colors.Colors.grayColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Search themes here',
                hintStyle: TextStyle(color: colors.Colors.secondaryTextColor),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/menu.png',
            width: 32,
            height: 32,
          ),
          Image.asset(
            'assets/images/bell.png',
            width: 32,
            height: 32,
          )
        ],
      ),
    );
  }
}
