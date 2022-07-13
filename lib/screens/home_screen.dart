import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/company.dart';
import '../tab_selection_screen.dart';
import 'stock_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //top app bar
      appBar: AppBar(
        title: const Text('Harsh Purohit', style: TextStyle(color: myColor)),
        backgroundColor: Colors.white,
        leading: const Icon(Icons.equalizer_rounded, size: 30, color: myColor),
        elevation: 0,
        actionsIconTheme: const IconThemeData(color: myColor),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.bell_solid))
        ],
      ),
      body: Stack(children: [
        Positioned(
          top: mq.height * .015,
          height: mq.height * .25,
          width: mq.width * .94,
          left: mq.width * .03,
          //top card containing portfolio value, deposit, withdraw, etc.
          child: Card(
            elevation: 10,
            color: myColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () {},
              child: Stack(children: [
                Positioned(
                  top: mq.width * .1,
                  left: mq.width * .075,
                  child: const Text('Portfolio value',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold)),
                ),
                Positioned(
                  top: mq.width * .175,
                  left: mq.width * .075,
                  child: Wrap(
                    spacing: 8,
                    children: const [
                      Text('\$15,136.32',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 30)),
                      Text('2.11% \u{FFEA}',
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 12))
                    ],
                  ),
                ),
                Positioned(
                    bottom: mq.width * .05,
                    left: mq.width * .075,
                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.greenAccent.shade400,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text(' Deposit ')),
                        SizedBox(
                          width: mq.width * .025,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                side: const BorderSide(color: Colors.white60),
                                primary: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text('Withdraw')),
                      ],
                    )),
                Positioned(
                  top: mq.width * .075,
                  right: mq.width * .075,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(children: const [
                      CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.apple_rounded,
                            color: myColor,
                          )),
                      SizedBox(height: 4),
                      CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.paypal_rounded,
                            color: myColor,
                          )),
                      SizedBox(height: 4),
                      CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.adobe_rounded,
                            color: myColor,
                          )),
                      SizedBox(height: 4),
                      Icon(Icons.arrow_drop_down_sharp)
                    ]),
                  ),
                ),
              ]),
            ),
          ),
        ),

        //watchlist & see all label
        Positioned(
            top: mq.height * .325,
            height: mq.height * .05,
            width: mq.width * .9,
            left: mq.width * .05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(' Watchlist',
                    style: TextStyle(
                        color: myColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Text('See All ',
                    style: TextStyle(
                        color: Colors.greenAccent.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            )),

        //list of all watchlist items
        Positioned(
            top: mq.height * .375,
            width: mq.width * .95,
            height: mq.height * .2,
            left: mq.width * .05,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                WatchListItem(
                  company: Company(
                      abbreviation: 'ADB',
                      name: 'Adobe',
                      growth: '7.68%',
                      img: 'adobe',
                      value: '26.43',
                      price: '543.58'),
                ),
                WatchListItem(
                  company: Company(
                      abbreviation: 'TSLA',
                      name: 'Tesla',
                      growth: '11.4%',
                      img: 'tesla',
                      value: '30.21',
                      price: '454.54'),
                ),
                WatchListItem(
                  company: Company(
                      abbreviation: 'GL',
                      name: 'Google',
                      growth: '12.48%',
                      img: 'google',
                      value: '33.49',
                      price: '643.58'),
                ),
                WatchListItem(
                  company: Company(
                      name: 'Apple',
                      abbreviation: 'APPL',
                      growth: '9.23%',
                      img: 'apple',
                      value: '24.56',
                      price: '187.08'),
                ),
              ],
            )),

        //stock activity label
        Positioned(
          bottom: mq.height * .125,
          width: mq.width * .9,
          left: mq.width * .05,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(' Stocks Activity',
                  style: TextStyle(
                      color: myColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),

              //demo card for showing stock activity
              Card(
                margin:
                    EdgeInsets.only(top: mq.height * .025, left: 4, right: 4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white.withOpacity(.8),
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: mq.width * .9,
                    height: mq.height * .1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const ImageIcon(AssetImage('assets/images/nvidia.png'),
                            size: 50, color: myColor),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: '\n NVDA',
                              style: TextStyle(
                                  color: myColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '\n Nvidia',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ])),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: '\n 25.94',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '\n \u{FFEA} 0.14%',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ])),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: '\n \$227.26',
                              style: TextStyle(
                                  color: myColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '\n 10 shares',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ])),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

//card for single watchlist item, displaying company or brand
class WatchListItem extends StatelessWidget {
  const WatchListItem({Key? key, required this.company}) : super(key: key);

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white.withOpacity(.8),
        child: InkWell(
          onTap: () {
            //when a watchlist item is clicked then move to stock details screen
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => StockDetailsScreen(company: company)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: mq.width * .7,
                  child: ListTile(
                    leading: IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                            AssetImage('assets/images/${company.img}.png'),
                            size: 60,
                            color: myColor)),
                    title: Text(company.abbreviation,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${company.name} Inc.'),
                    trailing: Text('${company.growth} \u{FFEA}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        )),
                  )),
              Wrap(
                spacing: mq.width * .25,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '\n     ${company.value}',
                        style: const TextStyle(
                            color: myColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '\n       \$${company.price}',
                        style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ])),
                  const ImageIcon(AssetImage('assets/images/graph.png'),
                      size: 60, color: myColor),
                ],
              )
            ],
          ),
        ));
  }
}
