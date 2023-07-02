import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int _selectedPaymentOption = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: searchColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 0,
        title: SmallText(text: MyStrings.payment.toUpperCase(),color: whiteColor,fontFamily: MyStrings.aclonica,fontWeight: FontWeight.normal),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(text: MyStrings.delivery,fontFamily: MyStrings.aclonica,size: 28,),
            const SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: MyStrings.addressDetails,fontFamily: MyStrings.aclonica,),
                TextButton(
                    onPressed: (){},
                    child: SmallText(text: MyStrings.change,fontFamily: MyStrings.aclonica,color: sideMenuColor)),
              ],
            ),
            const SizedBox(height: 16,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: 'Jaya Kranthi',fontFamily: MyStrings.aclonica,),
                    heightSpace,
                    Divider(
                      color: dividerColor,
                      height: 1,
                      thickness: 1,

                    ),
                    heightSpace,
                    Row(
                      children: [
                        Expanded(child: SmallText(text: "no.5-5-578/2, Gujjanagundla, Guntur - 522006",fontFamily: MyStrings.aclonica,)),
                      ],
                    ),
                    heightSpace,
                    Divider(
                      color: dividerColor,
                      height: 1,
                      thickness: 1,

                    ),
                    heightSpace,
                    SmallText(text: '+91 7659818566',fontFamily: MyStrings.aclonica),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            SmallText(text: MyStrings.payment,fontFamily: MyStrings.aclonica,size: 28,),
            const SizedBox(height: 15,),

            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RadioListTile(
                      activeColor: sideMenuColor,
                      title: SmallText(text: MyStrings.cashOnDelivery,fontFamily: MyStrings.aclonica,),
                      value: 0,
                      groupValue: _selectedPaymentOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentOption = value!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Divider(
                        color: dividerColor,
                        height: 1,
                        thickness: 1,

                      ),
                    ),
                    RadioListTile(
                      activeColor: sideMenuColor,

                      title:SmallText(text: MyStrings.payOnline,fontFamily: MyStrings.aclonica,),
                      value: 1,
                      groupValue: _selectedPaymentOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentOption = value!;
                        });
                      },
                    ),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 70,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: MyStrings.total,fontFamily: MyStrings.aclonica),
                SmallText(text:'\u{20B9}1234.00/-',fontFamily: MyStrings.aclonica,size: 18,fontWeight: FontWeight.w400),
              ],
            ),
            const SizedBox(height: 20,),

            Container(
              width: double.infinity,
              height: 60,// Make the button expand to full width
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Perform payment processing based on the selected option
                  if (_selectedPaymentOption == 0) {
                    // Cash on Delivery logic
                    print('Cash on Delivery selected');
                  } else {
                    // Pay Online logic
                    print('Pay Online selected');
                  }
                },
                child: SmallText(text: MyStrings.proceedToPayment,color: whiteColor,fontFamily: MyStrings.aclonica,fontWeight: FontWeight.normal),
              ),
            ),          ],
        ),
      ),
    );
  }
}
