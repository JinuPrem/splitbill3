import 'package:flutter/material.dart';
import 'package:splitbill3/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentSliderValue = 0;
  double Tip=0;
  String total='';
 String taxation='0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Split Bill',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('\$'+total, style: TextStyle(fontSize: 20))
                          ],
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Column(
                          children: [
                            Text('Friends',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
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
                            Text(_currentSliderValue.round().toString(), style: TextStyle(fontSize: 20)),
                            Text(taxation, style: TextStyle(fontSize: 20)),
                            Text(Tip.toString(), style: TextStyle(fontSize: 20)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'How Many Friends?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 100,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                }),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Text(
                            'TIP',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    Tip--;
                                  });
                                },
                                child: Text(
                                  '-',
                                  style: TextStyle(fontSize: 40),
                                ),
                                backgroundColor: Colors.grey,
                              ),
                              Text(
                                Tip.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    Tip++;
                                  });
                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(fontSize: 40),
                                ),
                                backgroundColor: Colors.grey,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value){
                        setState(() {

                          taxation=value;
                        });
                      },
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tax in %',
                          hintText: 'Tax'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildFloatingActionButton('1', Colors.grey),
                buildFloatingActionButton('2', Colors.grey),
                buildFloatingActionButton('3', Colors.grey),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildFloatingActionButton('4', Colors.grey),
                buildFloatingActionButton('5', Colors.grey),
                buildFloatingActionButton('6', Colors.grey),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildFloatingActionButton('7', Colors.grey),
                buildFloatingActionButton('8', Colors.grey),
                buildFloatingActionButton('9', Colors.grey),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildFloatingActionButton('.', Colors.grey),
                buildFloatingActionButton('0', Colors.grey),
                buildFloatingActionButton('x', Colors.grey),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 320,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(total,_currentSliderValue,Tip,taxation)));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text(
                      'Split Bill',
                      style: TextStyle(fontSize: 25),
                    )))
          ],
        ),
      ),
    );
  }

  SizedBox buildFloatingActionButton(String text, Color color) {
    return SizedBox(
      width: 100,
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            total+=text;
            if(text=='x'){
              total='';
            }
          });
        },
        backgroundColor: color,
        child: Text(
          text,
          style: TextStyle(fontSize: 30),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
