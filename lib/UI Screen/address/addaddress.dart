import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

enum LocationType { home, work, others }

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
  String currentPinCode = "";
  String currentCountry = "";
  String currentState = "";
  String currentStreet = "";
  String currentCity = "";
  Position? currentPosition;

  bool currentLocation = false;

  final TextEditingController _pinCodeController = TextEditingController();
  String? _selectedOption;

  void displayMsg(msg) {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pinCodeController.addListener(() {});
  }

  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Location fetch

    Future<Position?> determinePosition() async {
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
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        Placemark place = placemarks[0];
        setState(() {
          currentPosition = position;
          currentPinCode = '${place.postalCode}';
          currentCountry = '${place.country}';
          currentState = '${place.administrativeArea}';
          currentCity = '${place.locality}';
          currentStreet = '${place.thoroughfare}';
          currentAddress =
              "${place.locality},${place.postalCode},${place.country},${place.street},${place.administrativeArea},${place.thoroughfare},${place.thoroughfare}";
        });
      } catch (e) {
        Fluttertoast.showToast(msg: 'Invalid Location');
      }
      return null;
    }

    return Scaffold(
      backgroundColor: categoriesBgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: SmallText(
            text: MyStrings.addAddress.toUpperCase(),
            fontFamily: MyStrings.aclonica,
            color: whiteColor,
            fontWeight: FontWeight.w500,
            size: 18),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmallText(
                text: MyStrings.getLocation,
                size: 18,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    determinePosition();
                    setState(() {
                      currentLocation = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectMap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SmallText(
                      text: MyStrings.selectedLocation,
                      fontFamily: MyStrings.poppins,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SmallText(
                text: MyStrings.basicDetails,
                size: 18,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  filled: false,
                  hoverColor: primaryColor,
                  focusColor: primaryColor,
                  isDense: true,
                  counterText: "",
                  hintText: MyStrings.name,
                  hintStyle: TextStyle(color: addressTextColor, fontSize: 16),
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                  hintStyle: TextStyle(color: addressTextColor, fontSize: 16),
                  hintText: MyStrings.mobileNumber,
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SmallText(
                text: MyStrings.addressDetails,
                size: 18,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  filled: false,
                  hoverColor: primaryColor,
                  focusColor: primaryColor,
                  isDense: true,
                  counterText: "",
                  hintStyle: TextStyle(color: addressTextColor, fontSize: 16),
                  hintText: MyStrings.flatNo,
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: primaryColor,
                controller: TextEditingController(text: currentStreet),
                decoration: InputDecoration(
                  filled: false,
                  hoverColor: primaryColor,
                  focusColor: primaryColor,
                  isDense: true,
                  counterText: "",
                  hintStyle: TextStyle(color: addressTextColor, fontSize: 16),
                  hintText: MyStrings.street,
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  filled: false,
                  hoverColor: primaryColor,
                  focusColor: primaryColor,
                  isDense: true,
                  counterText: "",
                  hintText: MyStrings.landmark,
                  hintStyle: TextStyle(color: addressTextColor, fontSize: 16),
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: primaryColor,
                controller: TextEditingController(text: currentPinCode),
                keyboardType: TextInputType.number,
                maxLength: 6,
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
                  hintText: MyStrings.pinCode,
                  hintStyle: TextStyle(color: addressTextColor, fontSize: 16),
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: primaryColor,
                controller: TextEditingController(text: currentCountry),
                decoration: InputDecoration(
                  filled: false,
                  hoverColor: primaryColor,
                  focusColor: primaryColor,
                  isDense: true,
                  counterText: "",
                  hintStyle: TextStyle(color: addressTextColor, fontSize: 16),
                  hintText: MyStrings.country,
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: primaryColor,
                controller: TextEditingController(text: currentState),
                decoration: InputDecoration(
                  filled: false,
                  hoverColor: primaryColor,
                  focusColor: primaryColor,
                  isDense: true,
                  counterText: "",
                  hintStyle: TextStyle(color: addressTextColor, fontSize: 16),
                  hintText: MyStrings.state,
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: primaryColor,
                controller: TextEditingController(text: currentCity),
                decoration: InputDecoration(
                  filled: false,
                  hoverColor: primaryColor,
                  focusColor: primaryColor,
                  isDense: true,
                  counterText: "",
                  hintStyle: TextStyle(color: addressTextColor, fontSize: 16),
                  hintText: MyStrings.townVillage,
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: addressTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SmallText(
                text: MyStrings.addressDetails,
                size: 18,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'home',
                            groupValue: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value;
                              });
                            },
                            activeColor: blackColor,
                          ),
                          SmallText(
                              text: MyStrings.home.tr(),
                              fontFamily: MyStrings.poppins,
                              color: blackColor),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'work',
                            groupValue: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value;
                              });
                            },
                            activeColor: blackColor,
                          ),
                          SmallText(
                              text: MyStrings.work.tr(),
                              fontFamily: MyStrings.poppins,
                              color: blackColor),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'others',
                            groupValue: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value;
                              });
                            },
                            activeColor: blackColor,
                          ),
                          SmallText(
                              text: MyStrings.others.tr(),
                              fontFamily: MyStrings.poppins,
                              color: blackColor),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: const Size(140.0, 44.0),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: SmallText(
                      text: MyStrings.cancel,
                      color: whiteColor,
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: const Size(140.0, 44.0),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: SmallText(
                      text: MyStrings.submit,
                      color: whiteColor,
                    ))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
