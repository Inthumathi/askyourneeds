import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int reviewsCount = 42;

  void increaseReviews() {
    setState(() {
      reviewsCount++;
    });
  }

  void decreaseReviews() {
    setState(() {
      if (reviewsCount > 0) {
        reviewsCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff33056F),
      ),
      body: Container(
        width: 400,
        height: 300,
        color: Color(0xffE7D6FD),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("#7534975736575"),
                Text("Kurnool Old Rice"),
                Text("25kg"),
                SizedBox(height: 10),
                SizedBox(height: 10),
                Text(
                  '\u{20B9}1250.00/-',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(width: 10),
                    Text("4.2"),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 38,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: increaseReviews,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      reviewsCount.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 38,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: decreaseReviews,
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ],
        ),
      ),

    );
  }
}
