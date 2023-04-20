import 'package:askun_delivery_app/UI%20Screen/address/customCountrycode.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  String? countryValue;
  String? stateValue;
  String? cityValue;
  String currentAddress = "My Address";
  String currentPincode = "";
  String currentCountry = "";
  String currentState = "";
  String currentStreet = "";
  String currentCity = "";
  Position? currentPosition;

  bool currentLocation = false;

  final TextEditingController _pinCodeController = new TextEditingController();

  void displayMsg(msg) {
    print(msg);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pinCodeController.addListener(() {

    });
  }
  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    // Location fetch

    Future<Position?> _determinePosition() async {
      bool serviceEnable;
      LocationPermission permission;
      serviceEnable = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnable) {
        Fluttertoast.showToast(msg: "Please keep your location on");
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Fluttertoast.showToast(msg: "Location Permission Denied");
        }
      }
      if (permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(msg: "Permission is Denied Forever");
      }
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      try {
        List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
        Placemark place = placemarks[0];
        setState(() {
          currentPosition = position;
          currentPincode = '${place.postalCode}';
          currentCountry = '${place.country}';
          currentState = '${place.administrativeArea}';
          currentCity = '${place.locality}';
          currentStreet = '${place.thoroughfare}';
          currentAddress =
          "${place.locality},${place.postalCode},${place.country},${place.street},${place.administrativeArea},${place.thoroughfare},${place.thoroughfare}";
        });
      } catch (e) {
        print(e);
      }
      return null;
    }


    return Scaffold(
      backgroundColor: Color(0xfff2eff8),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: SmallText(text: 'Set Delivery Address',color:whiteColor,
            fontWeight: FontWeight.w500,
            size: 18),
      ),
      body:SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15,25,15,8),
              child: SmallText(text: 'Contact Info',size: 18,fontWeight: FontWeight.w500,color: addressTextColor.withOpacity(0.7),),
            ),
            Material(
              elevation: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10,12,12,12),
                color: whiteColor,
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    TextField(
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        filled: false,
                        hoverColor: primaryColor,
                        focusColor: primaryColor,
                        isDense: true,
                        counterText: "",
                        hintText: MyStrings.name,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          size: 23,
                          color: iconColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: addressBorderColor,
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^1+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^2+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^3+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^4+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^5+')),
                      ],
                      decoration: InputDecoration(
                        filled: false,
                        hoverColor: primaryColor,
                        focusColor: primaryColor,
                        isDense: true,
                        counterText: "",
                        hintText: MyStrings.mobileNumber,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.call,
                          size: 23,
                          color: iconColor,
                        ),

                      ),
                    ),
                    SizedBox(height: 5,),
                  ],
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15,25,15,8),
              child: SmallText(text: 'Commom',size: 18,fontWeight: FontWeight.w500,color: addressTextColor.withOpacity(0.7),),
            ),
            Material(
              elevation: 1,
              child: InkWell(
                onTap: (){
                  _determinePosition();
                  setState(() {
                    currentLocation = true;
                    print(currentLocation);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10,12,12,12),
                  color: whiteColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.add_location_alt,color: iconColor,),
                          widthSpace,
                          SmallText(text: MyStrings.currentLocation),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right,color: iconColor,)
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15,25,15,8),
              child: SmallText(text:MyStrings.addressInfo,size: 18,fontWeight: FontWeight.w500,color: addressTextColor.withOpacity(0.7),),
            ),
            Material(
              elevation: 1,
              child: Container(
                // padding: const EdgeInsets.fromLTRB(10,12,12,12),
                color: whiteColor,
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    TextField(
                      cursorColor: primaryColor,


                      decoration: InputDecoration(
                        filled: false,
                        hoverColor: primaryColor,
                        focusColor: primaryColor,
                        isDense: true,
                        counterText: "",
                        hintText: MyStrings.flatNo,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.door_front_door_outlined,
                          size: 23,
                          color: iconColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: addressBorderColor,
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      cursorColor: primaryColor,

                      controller:TextEditingController(text: currentStreet),
                      decoration: InputDecoration(
                        filled: false,
                        hoverColor: primaryColor,
                        focusColor: primaryColor,
                        isDense: true,
                        counterText: "",
                        hintText: MyStrings.street,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.streetview_outlined,
                          size: 23,
                          color: iconColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: addressBorderColor,
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      cursorColor: primaryColor,


                      decoration: InputDecoration(
                        filled: false,
                        hoverColor: primaryColor,
                        focusColor: primaryColor,
                        isDense: true,
                        counterText: "",
                        hintText: MyStrings.landmark,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.emoji_transportation,
                          size: 23,
                          color: iconColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: addressBorderColor,
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      cursorColor: primaryColor,
                      controller:TextEditingController(text: currentPincode),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^1+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^2+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^3+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^4+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^5+')),
                      ],
                      decoration: InputDecoration(
                        filled: false,
                        hoverColor: primaryColor,
                        focusColor: primaryColor,
                        isDense: true,
                        counterText: "",
                        hintText: MyStrings.pincode,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.push_pin,
                          size: 23,
                          color: iconColor,
                        ),

                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: addressBorderColor,
                    ),
                    SizedBox(height: 5,),
                    currentLocation == true?Column(
                      children: [
                        SizedBox(height: 5,),
                        TextField(
                          cursorColor: primaryColor,
                          controller:TextEditingController(text: currentCountry),
                          decoration: InputDecoration(
                            filled: false,
                            hoverColor: primaryColor,
                            focusColor: primaryColor,
                            isDense: true,
                            counterText: "",
                            hintText: MyStrings.country,
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(
                              Icons.flag,
                              size: 23,
                              color: iconColor,
                            ),

                          ),
                        ),
                        SizedBox(height: 5,),
                        TextField(
                          cursorColor: primaryColor,
                          controller:TextEditingController(text: currentState),
                          decoration: InputDecoration(
                            filled: false,
                            hoverColor: primaryColor,
                            focusColor: primaryColor,
                            isDense: true,
                            counterText: "",
                            hintText: MyStrings.state,
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(
                              Icons.flag_circle,
                              size: 23,
                              color: iconColor,
                            ),

                          ),
                        ),
                        SizedBox(height: 5,),
                        TextField(
                          cursorColor: primaryColor,
                          controller:TextEditingController(text: currentCity),
                          decoration: InputDecoration(
                            filled: false,
                            hoverColor: primaryColor,
                            focusColor: primaryColor,
                            isDense: true,
                            counterText: "",
                            hintText: MyStrings.townVillage,
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(
                              Icons.flag_outlined,
                              size: 23,
                              color: iconColor,
                            ),

                          ),
                        ),
                        SizedBox(height: 5,),
                      ],
                    ):  SelectState(
                      onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      },
                      onCountryTap: () => displayMsg('You\'ve tapped on countries!'),
                      onStateChanged: (value) {
                        setState(() {
                          stateValue = value;
                        });
                      },
                      onStateTap: () => displayMsg('You\'ve tapped on states!'),
                      onCityChanged: (value) {
                        setState(() {
                          cityValue = value;
                        });
                      },
                      onCityTap: () => displayMsg('You\'ve tapped on cities!'),
                    ),
                  ],
                ),
              ),
            ),
            // Text(
            //   currentAddress,
            //   style: TextStyle(fontSize: 18),
            // ),
          ],
        ),
      ),
    );
  }
}
