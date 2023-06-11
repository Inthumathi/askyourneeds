import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:flutter/material.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // Example list of addresses
  final List<Map<String, String>> addresses = [
    {'label': 'Name', 'address': 'John Doe'},
    {'label': 'Address', 'address': '123 Main Street'},
    {'label': 'Phone Number', 'address': '+1 555-1234'},
    // Add more addresses as needed
  ];

  bool payOnDelivery = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: SmallText(text: MyStrings.checkOut.toUpperCase(), color:blackColor),

      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              SmallText(text: MyStrings.delivery, fontWeight: FontWeight.w500, size: 20),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text: MyStrings.addressDetails),

                  SmallText(text: MyStrings.change),
                  // Add your row content here
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (BuildContext context, int index) {
                    final address = addresses[index];
                    return ListTile(
                      title: Text(address['label']!),
                      subtitle: Text(address['address']!),
                      // Add your list tile content here
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    SmallText(text: MyStrings.paymemt),
                    RadioListTile<bool>(
                      title: const Text('Pay on Delivery'),
                      value: true,
                      groupValue: payOnDelivery,
                      onChanged: (bool? value) {
                        setState(() {
                          payOnDelivery = value!;
                        });
                      },
                    ),
                    Container(
                      height: 0.2,
                      color: Colors.black,
                    ),

                    RadioListTile<bool>(
                      title: const Text('Pay Online'),
                      value: false,
                      groupValue: payOnDelivery,
                      onChanged: (bool? value) {
                        setState(() {
                          payOnDelivery = value!;
                        });
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SmallText(text: MyStrings.total),
                            ),
                            const Text('\u{20B9}1250.00/-'),
                          ],
                        ),
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: () {
                            // Add your submit button logic here
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xffFA4A0C),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: SmallText(
                              text: MyStrings.proccedToPayment,
                              color: whiteColor,
                              size: 18,
                            ),
                          ),
                        ),


                      ],
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
