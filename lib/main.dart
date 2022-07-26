import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          padding: const EdgeInsets.only(top: 50),
          color: colors.Colors.backgroundColor,
          child: Column(
            children: const [
              TopSection(),
              SizedBox(height: 25,),
              WelcomeSection(),
              SizedBox(height: 25,),
              InProgressSection(),
              SizedBox(height: 25,),
              RecommendedSection()
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recommended',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.arrow_forward_rounded, color: colors.Colors.accentColor,)
              ],
            ),
          ),
          const SizedBox(height: 25,),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 15, right: 15),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: const [
                RecommendedItemCard(title: 'Happiness and Joyful', session: '4', iconData: Icons.emoji_emotions_outlined,),
                SizedBox(width: 15,),
                RecommendedItemCard(title: 'Lovely and Beautiful Vibes', session: '7', iconData: Icons.favorite_border,),
                SizedBox(width: 15,),
                RecommendedItemCard(title: 'Soothing and Soulful', session: '2', iconData: Icons.ac_unit,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RecommendedItemCard extends StatelessWidget {
  const RecommendedItemCard({Key? key, required this.title, required this.session, required this.iconData}) : super(key: key);

  final String title;
  final String session;
  final IconData iconData;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: colors.Colors.iconBackgroundColor,
                borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(10),
            child: Icon(
              iconData,
              color: colors.Colors.accentColor,
              size: 40,
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            '$session sessions',
            style: TextStyle(
              color: colors.Colors.secondaryTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class InProgressSection extends StatelessWidget {
  const InProgressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'In Progress',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: colors.Colors.iconBackgroundColor,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.dark_mode_outlined,
                    color: colors.Colors.accentColor,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'The Silent Night Vibes',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  '2/4 sessions left',
                  style: TextStyle(
                    color: colors.Colors.secondaryTextColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '75%',
                      style: TextStyle(
                        color: colors.Colors.secondaryTextColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 0.75,
                          color: colors.Colors.accentColor,
                          backgroundColor: colors.Colors.grayColor,
                          minHeight: 10,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
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
          const SizedBox(
            height: 5,
          ),
          Text(
            'Ready to start your day?',
            style: TextStyle(
                color: colors.Colors.secondaryTextColor,
                fontWeight: FontWeight.normal,
                fontSize: 15),
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: colors.Colors.grayColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Search themes here',
                hintStyle: TextStyle(color: colors.Colors.secondaryTextColor),
                prefixIcon: Icon(
                  Icons.search,
                  color: colors.Colors.secondaryTextColor,
                ),
                suffixIcon: Icon(
                  Icons.mic,
                  color: colors.Colors.recordColor,
                ),
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
