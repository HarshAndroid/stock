import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/market_item.dart';
import '../tab_selection_screen.dart';

class MarketsScreen extends StatefulWidget {
  const MarketsScreen({Key? key}) : super(key: key);

  @override
  State<MarketsScreen> createState() => _MarketsScreenState();
}

class _MarketsScreenState extends State<MarketsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //top app bar
      appBar: AppBar(
        title: const Text('Markets', style: TextStyle(color: myColor)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios_new_rounded, color: myColor),
        elevation: 0,
        actionsIconTheme: const IconThemeData(color: myColor),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.bell_solid))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, top: 8, bottom: mq.height * .1),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: mq.height * .25,
              width: mq.width * .94,
              //list view for displaying demo market cards
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  //demo card 1
                  Card(
                    color: Colors.white.withOpacity(.7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: mq.width * .05),
                        width: mq.width * .7,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('\n\nDow Jones',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              const Text('\$15,136.32',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30)),
                              const Text('  2.11% \u{FFEA}',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              //demo image for graph
                              Expanded(
                                  child: Image.asset(
                                      'assets/images/growth_green.png'))
                            ]),
                      ),
                    ),
                  ),
                  //demo card 2
                  Card(
                    color: myColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: mq.width * .05),
                        width: mq.width * .7,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('\n\nS&P 500',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              const Text('\$5,136.32',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30)),
                              const Text('  1.11% \u{FFEA}',
                                  style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              //demo image for graph
                              Expanded(
                                  child: Image.asset(
                                      'assets/images/growth_green.png'))
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //search field
            Container(
              margin: EdgeInsets.symmetric(vertical: mq.height * .025),
              width: mq.width * .9,
              child: CupertinoSearchTextField(
                onChanged: (value) {},
                onSubmitted: (value) {},
                itemSize: 30,
                itemColor: myColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              ),
            ),

            //market mover segment with label & different company cards
            const Text('  Market Movers\n',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: myColor, fontWeight: FontWeight.bold, fontSize: 20)),
            MarketMoverItem(
                item: MarketItem(
                    abbreviation: 'GL',
                    name: 'Google',
                    growth: '12.48%',
                    img: 'google',
                    value: '33.49',
                    price: '643.58',
                    shares: '100')),
            MarketMoverItem(
                item: MarketItem(
                    name: 'Apple',
                    abbreviation: 'APPL',
                    growth: '9.23%',
                    img: 'apple',
                    value: '24.56',
                    price: '187.08',
                    shares: '50')),
            MarketMoverItem(
              item: MarketItem(
                  abbreviation: 'ADB',
                  name: 'Adobe',
                  growth: '7.68%',
                  img: 'adobe',
                  value: '26.43',
                  price: '543.58',
                  shares: '10'),
            ),
            MarketMoverItem(
                item: MarketItem(
                    abbreviation: 'TSLA',
                    name: 'Tesla',
                    growth: '11.4%',
                    img: 'tesla',
                    value: '30.21',
                    price: '454.54',
                    shares: '20')),
          ]),
        ),
      ),
    );
  }
}

//card representing a single market mover item (i.e. company)
class MarketMoverItem extends StatelessWidget {
  const MarketMoverItem({Key? key, required this.item}) : super(key: key);

  final MarketItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 1,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: mq.width * .9,
          height: mq.height * .1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageIcon(AssetImage('assets/images/${item.img}.png'),
                  size: 30, color: myColor),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '\n ${item.abbreviation}',
                    style: const TextStyle(
                        color: myColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: '\n ${item.name}',
                    style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ])),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '\n ${item.value}',
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: '\n \u{FFEA} ${item.growth}%',
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ])),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '\n \$${item.price}',
                    style: const TextStyle(
                        color: myColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: '\n  ${item.shares} shares',
                    style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
