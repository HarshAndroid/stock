import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/company.dart';
import '../tab_selection_screen.dart';

class StockDetailsScreen extends StatefulWidget {
  const StockDetailsScreen({Key? key, required this.company}) : super(key: key);

  final Company company;

  @override
  State<StockDetailsScreen> createState() => _StockDetailsScreenState();
}

class _StockDetailsScreenState extends State<StockDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //top app bar
      appBar: AppBar(
        title: const Text('Stock Details', style: TextStyle(color: myColor)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child:
                const Icon(Icons.arrow_back_ios_new_rounded, color: myColor)),
        elevation: 0,
        actionsIconTheme: const IconThemeData(color: myColor),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.share))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //company details with logo, name & growth
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200, shape: BoxShape.circle),
              padding: const EdgeInsets.all(10),
              child: ImageIcon(
                  AssetImage('assets/images/${widget.company.img}.png'),
                  size: 30,
                  color: myColor),
            ),
            title: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: ' ${widget.company.abbreviation}',
                  style: const TextStyle(
                      color: myColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: '\n ${widget.company.name} Inc.',
                  style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ])),
            trailing: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '\$${widget.company.price}  ',
                  style: const TextStyle(
                      color: myColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: '\n\u{FFEA} ${widget.company.growth}  ',
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ])),
          ),

          //timeline button for displaying graphs
          const TimelineBtns(),

          //dummy graph image (for all timelines)
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mq.width * .1, vertical: mq.height * .05),
              child: Image.asset('assets/images/growth_green.png')),

          //card to give overview of current company
          Card(
            margin: EdgeInsets.symmetric(horizontal: mq.width * .05),
            color: Colors.white.withOpacity(.8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  leading: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    padding: const EdgeInsets.all(10),
                    child: ImageIcon(
                        AssetImage('assets/images/${widget.company.img}.png'),
                        size: 30,
                        color: myColor),
                  ),
                  title: const Text(
                    'Overview',
                    style: TextStyle(
                        color: myColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.question_mark_rounded),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: ' Open',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '\n \$909.68\n',
                          style: TextStyle(
                              color: myColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ])),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: ' Day low',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '\n \$902.11\n',
                          style: TextStyle(
                              color: myColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ])),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: ' Day high',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '\n \$910.18\n',
                          style: TextStyle(
                              color: myColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ])),
                  ],
                ),
              ],
            ),
          ),
          //adding some space
          SizedBox(height: mq.height * .05),

          //buy & share buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(mq.width * .4, mq.height * .075),
                      primary: Colors.greenAccent.shade400,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text('Buy')),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(mq.width * .4, mq.height * .075),
                      primary: myColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text('Follow')),
            ],
          ),
        ]),
      ),
    );
  }
}

//choice chips for status according to timeline
class TimelineBtns extends StatefulWidget {
  const TimelineBtns({Key? key}) : super(key: key);

  @override
  State<TimelineBtns> createState() => _TimelineBtnsState();
}

class _TimelineBtnsState extends State<TimelineBtns> {
  String _selection = '1D';

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ChoiceChip(
        elevation: 2,
        backgroundColor: const Color.fromARGB(255, 247, 243, 243),
        selectedColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: const Text(' 1D ', style: TextStyle(color: myColor)),
        selected: _selection == '1D',
        onSelected: (selected) {
          setState(() {
            _selection = selected ? '1D' : '';
          });
        },
      ),
      ChoiceChip(
        elevation: 2,
        backgroundColor: const Color.fromARGB(255, 247, 243, 243),
        selectedColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: const Text(' 1W ', style: TextStyle(color: myColor)),
        selected: _selection == '1W',
        onSelected: (selected) {
          setState(() {
            _selection = selected ? '1W' : '';
          });
        },
      ),
      ChoiceChip(
        elevation: 2,
        backgroundColor: const Color.fromARGB(255, 247, 243, 243),
        selectedColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: const Text(' 1M ', style: TextStyle(color: myColor)),
        selected: _selection == '1M',
        onSelected: (selected) {
          setState(() {
            _selection = selected ? '1M' : '';
          });
        },
      ),
      ChoiceChip(
        elevation: 2,
        backgroundColor: const Color.fromARGB(255, 247, 243, 243),
        selectedColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: const Text(' 1Y ', style: TextStyle(color: myColor)),
        selected: _selection == '1Y',
        onSelected: (selected) {
          setState(() {
            _selection = selected ? '1Y' : '';
          });
        },
      ),
      ChoiceChip(
        elevation: 2,
        backgroundColor: const Color.fromARGB(255, 247, 243, 243),
        selectedColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: const Text('ALL', style: TextStyle(color: myColor)),
        selected: _selection == 'ALL',
        onSelected: (selected) {
          setState(() {
            _selection = selected ? 'ALL' : '';
          });
        },
      ),
    ]);
  }
}
