// import 'package:askun_delivery_app/utilites/constant.dart';
// import 'package:askun_delivery_app/utilites/strings.dart';
// import 'package:askun_delivery_app/widget/smalltext.dart';
// import 'package:flutter/material.dart';
//
// class AddNewAddressScreen extends StatefulWidget {
//   const AddNewAddressScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
// }
//
// class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
//   String? _selectedOption;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: selectedSubCategoriesBgColor,
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         title: SmallText(
//             text: MyStrings.addNewAddress, fontFamily: MyStrings.poppins),
//         centerTitle: true,
//         automaticallyImplyLeading: true,
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: Icon(Icons.keyboard_arrow_left, color: whiteColor),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             children: [
//               Center(
//                   child: SmallText(
//                 text: MyStrings.getLocation,
//                 fontFamily: MyStrings.poppins,
//                 fontWeight: FontWeight.w500,
//               )),
//               heightSpace,
//               Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                     color: selectMap, borderRadius: BorderRadius.circular(10)),
//                 child: Center(
//                     child: SmallText(
//                   text: MyStrings.selectLocationFromMap,
//                   color: whiteColor,
//                   fontWeight: FontWeight.bold,
//                   size: 18,
//                 )),
//               ),
//               heightSpace,
//               SmallText(
//                 text: MyStrings.basicDetails,
//                 fontFamily: MyStrings.poppins,
//                 fontWeight: FontWeight.w500,
//               ),
//               heightSpace,
//               heightSpace,
//               Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SmallText(
//                           text: MyStrings.enterFullName,
//                           fontFamily: MyStrings.poppins,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.grey,
//                         ),
//                       ],
//                     ),
//                     heightSpace,
//                     Container(
//                       height: 1,
//                       color: Colors.grey,
//                     ),
//                     heightSpace,
//                     heightSpace,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SmallText(
//                           text: MyStrings.enterMobileNumber,
//                           fontFamily: MyStrings.poppins,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.grey,
//                         ),
//                       ],
//                     ),
//                     heightSpace,
//                     Container(
//                       height: 1,
//                       color: Colors.grey,
//                     ),
//                     heightSpace,
//                     heightSpace,
//                     Column(
//                       children: [
//                         SmallText(
//                             text: MyStrings.addressDetails,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: MyStrings.poppins),
//                         heightSpace,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: const [
//                             Text("Enter House  No./Flat No.",
//                                 style: TextStyle(
//                                     fontFamily: MyStrings.poppins,
//                                     color: Colors.grey,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500)),
//                           ],
//                         ),
//                         heightSpace,
//                         Container(
//                           height: 1,
//                           color: Colors.grey,
//                         ),
//                         heightSpace,
//                         heightSpace,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text("Enter Street No./ Name",
//                                 style: TextStyle(
//                                     fontFamily: MyStrings.poppins,
//                                     color: Colors.grey,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500)),
//                           ],
//                         ),
//                         heightSpace,
//                         Container(
//                           height: 1,
//                           color: Colors.grey,
//                         ),
//                         heightSpace,
//                         heightSpace,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SmallText(
//                               text: MyStrings.enterNearByLandMark,
//                               fontFamily: MyStrings.poppins,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.grey,
//                             ),
//                           ],
//                         ),
//                         heightSpace,
//                         Container(
//                           height: 1,
//                           color: Colors.grey,
//                         ),
//                         heightSpace,
//                         heightSpace,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SmallText(
//                               text: MyStrings.enterAreaName,
//                               fontFamily: MyStrings.poppins,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.grey,
//                             ),
//                           ],
//                         ),
//                         heightSpace,
//                         Container(
//                           height: 1,
//                           color: Colors.grey,
//                         ),
//                         heightSpace,
//                         heightSpace,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SmallText(
//                               text: MyStrings.enterCityName,
//                               fontFamily: MyStrings.poppins,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.grey,
//                             ),
//                           ],
//                         ),
//                         heightSpace,
//                         Container(
//                           height: 1,
//                           color: Colors.grey,
//                         ),
//                         heightSpace,
//                         heightSpace,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SmallText(
//                               text: MyStrings.enterStateName,
//                               fontFamily: MyStrings.poppins,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.grey,
//                             ),
//                           ],
//                         ),
//                         heightSpace,
//                         Container(
//                           height: 1,
//                           color: Colors.grey,
//                         ),
//                         heightSpace,
//                         heightSpace,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text("Enter Pincode / Postalcode",
//                                 style: TextStyle(
//                                     fontFamily: MyStrings.poppins,
//                                     color: Colors.grey,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500)),
//                           ],
//                         ),
//                         heightSpace,
//                         Container(
//                           height: 1,
//                           color: Colors.grey,
//                         ),
//                         heightSpace,
//                         heightSpace,
//                         SmallText(
//                             text: MyStrings.addressDetails,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: MyStrings.poppins),
//                         heightSpace,
//                         heightSpace,
//                         Container(
//                           height: 55,
//                           color: whiteColor,
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Radio<String>(
//                                     value: 'home',
//                                     groupValue: _selectedOption,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         _selectedOption = value;
//                                       });
//                                     },
//                                     activeColor: Colors.black,
//                                   ),
//                                   const Text('Home'),
//                                 ],
//                               ),
//                               const SizedBox(width: 10),
//                               Row(
//                                 children: [
//                                   Radio<String>(
//                                     value: 'work',
//                                     groupValue: _selectedOption,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         _selectedOption = value;
//                                       });
//                                     },
//                                     activeColor: Colors.black,
//                                   ),
//                                   const Text('Work'),
//                                 ],
//                               ),
//                               SizedBox(width: 10),
//                               Row(
//                                 children: [
//                                   Radio<String>(
//                                     value: 'others',
//                                     groupValue: _selectedOption,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         _selectedOption = value;
//                                       });
//                                     },
//                                     activeColor: Colors.black,
//                                   ),
//                                   Text('Others'),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         heightSpace,
//                         heightSpace,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   // Submit button pressed
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: primaryColor,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                   ),
//                                   minimumSize: Size(140.0, 44.0),
//                                 ),
//                                 child: Text(
//                                   style: TextStyle(fontFamily: MyStrings.poppins,fontWeight: FontWeight.w500,color: whiteColor),
//                                   'Cancel',
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 40,),
//                             Container(
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   // Submit button pressed
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: primaryColor,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                   ),
//                                   minimumSize: Size(140.0, 44.0),
//                                 ),
//
//                                 child: Text(
//                                   'Submit',
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
