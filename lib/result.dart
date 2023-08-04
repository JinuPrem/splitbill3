import 'package:flutter/material.dart';
import 'package:splitbill3/homepage.dart';

class Result extends StatefulWidget {
  late final total;
  late final _currentSliderValue;
  late final Tip;
  late final taxation;

  Result(this.total, this._currentSliderValue, this.Tip, this.taxation);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String totalamount = '';
  String totaltaxation = '';
  double totaltip = 0;
  double total_currentSliderValue = 0;
  double totalbill = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalamount = widget.total;
    totaltaxation = widget.taxation;
    totaltip = widget.Tip;
    total_currentSliderValue = widget._currentSliderValue;

    calculate();
  }

  void calculate() {
    double tax = double.parse(totalamount.toString()) *
        (double.parse(totaltaxation.toString()) / 100);
    print(tax);
    // double ttax=double.parse(totaltaxation.toString())/100;
    // print(ttax);
    double tt=totaltip;
    // print(tt);
    // double tc=total_currentSliderValue;
    // print(tc);
    totalbill = (double.parse(totalamount.toString()) +
            tax +
            total_currentSliderValue+tt) /
        total_currentSliderValue;
    print(totalbill);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Result',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 380,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Equally Divided',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$' + totalbill.round().toString(),
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Column(
                      children: [
                        Text(
                          'Friends',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text('Tax',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Tip',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        Text(total_currentSliderValue.round().toString(),
                            style: TextStyle(fontSize: 20)),
                        Text(totaltaxation, style: TextStyle(fontSize: 20)),
                        Text(totaltip.toString(),
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Everybody Should Pay \$'+totalbill.round().toString(), style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text('Calculate Again?', style: TextStyle(fontSize: 25)))
        ],
      ),
    );
  }
}
