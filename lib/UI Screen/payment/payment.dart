import 'package:askun_delivery_app/UI%20Screen/address/addaddress.dart';
import 'package:askun_delivery_app/UI%20Screen/mycart/mycart.dart';
import 'package:askun_delivery_app/UI%20Screen/success/success_screen.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
            Expanded(
              child: ListView(
                children: [
                  SmallText(text: MyStrings.delivery,fontFamily: MyStrings.aclonica,size: 20,),
                  const SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: MyStrings.addressDetails,fontFamily: MyStrings.aclonica,),
                      TextButton(
                          onPressed: (){
                            showModalBottomSheet(
                              backgroundColor: whiteColor,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25)),
                              ),
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            const BorderRadius.only(
                                                topLeft:
                                                Radius.circular(25),
                                                topRight:
                                                Radius.circular(
                                                    25)),
                                            color: addressContainerColor),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              SmallText(
                                                text: MyStrings
                                                    .chooseDeliverAddress,
                                                fontFamily:
                                                MyStrings.aclonica,
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(
                                                      Icons.clear))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 20, 15, 10),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    child:
                                                    const AddAddress()));
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.add_circle,
                                                  color: primaryColor),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SmallText(
                                                text:
                                                MyStrings.addNewAddress,
                                                size: 16,
                                                fontFamily:
                                                MyStrings.aclonica,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2,
                                        color:
                                        dividerColor.withOpacity(0.3),
                                      ),
                                      ListView.builder(
                                        itemCount: addressList.length,
                                        physics:
                                        const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                activeAddress = index;
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                              child: Card(
                                                elevation: 3,
                                                color: whiteColor,
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20),
                                                ),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(
                                                      20.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      SmallText(
                                                        text: addressList[
                                                        index]
                                                            .name,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal,
                                                        fontFamily:
                                                        MyStrings
                                                            .aclonica,
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Divider(
                                                        color: dividerColor
                                                            .withOpacity(
                                                            0.2),
                                                        thickness: 2,
                                                      ),
                                                      SizedBox(height: 5,),
                                                      SmallText(
                                                          text:
                                                          '${addressList[index].doorNo}, ${addressList[index].streetName}- ${addressList[index].pinCode},Land Mark: ${addressList[index].landMark}',
                                                          fontWeight:
                                                          FontWeight
                                                              .normal,
                                                          color: blackColor,
                                                          size: 14,
                                                          fontFamily:
                                                          MyStrings
                                                              .aclonica),
                                                      Divider(
                                                        color: dividerColor
                                                            .withOpacity(
                                                            0.2),
                                                        thickness: 2,
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .call,
                                                            size: 16,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          SmallText(
                                                              text: addressList[
                                                              index]
                                                                  .number,
                                                              size: 14,
                                                              fontFamily:
                                                              MyStrings
                                                                  .aclonica),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
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
                  SmallText(text: MyStrings.payment,fontFamily: MyStrings.aclonica,size: 20,),
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
                ],
              ),
            ),
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
                  backgroundColor: primaryColor,
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
                    Razorpay razorpay = Razorpay();
                    var options = {
                      'key': 'rzp_live_ILgsfZCZoFIKMb',
                      'amount': 100,
                      'name': 'Acme Corp.',
                      'description': 'Fine T-Shirt',
                      'retry': {'enabled': true, 'max_count': 1},
                      'send_sms_hash': true,
                      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
                      'external': {
                        'wallets': ['paytm']
                      }
                    };
                    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
                    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
                    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
                    razorpay.open(options);
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


  void handlePaymentErrorResponse(PaymentFailureResponse response){
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child:   const SuccessScreen()));
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed:  () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
