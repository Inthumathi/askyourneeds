library country_state_city_picker_nona;

import 'dart:convert';
import 'package:askun_delivery_app/Models/address/selectstatemodel.dart'
    as StatusModel;
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:dropdown_search/dropdown_search.dart';

class SelectState extends StatefulWidget {
  final ValueChanged<String> onCountryChanged;
  final ValueChanged<String> onStateChanged;
  final ValueChanged<String> onCityChanged;
  final VoidCallback? onCountryTap;
  final VoidCallback? onStateTap;
  final VoidCallback? onCityTap;
  final TextStyle? style;
  final Color? dropdownColor;
  final InputDecoration decoration;
  final double spacing;

  const SelectState(
      {Key? key,
      required this.onCountryChanged,
      required this.onStateChanged,
      required this.onCityChanged,
      this.decoration =
          const InputDecoration(contentPadding: EdgeInsets.all(0.0)),
      this.spacing = 0.0,
      this.style,
      this.dropdownColor,
      this.onCountryTap,
      this.onStateTap,
      this.onCityTap})
      : super(key: key);

  @override
  _SelectStateState createState() => _SelectStateState();
}

class _SelectStateState extends State<SelectState> {
  List<String> _cities = ["Choose City"];
  List<String> _country = ["Choose Country"];
  String _selectedCity = "Choose City";
  String _selectedCountry = "Choose Country";
  String _selectedState = "Choose State/Province";
  List<String> _states = ["Choose State/Province"];
  var responses;

  @override
  void initState() {
    getCounty();
    super.initState();
  }

  Future getResponse() async {
    var res = await rootBundle.loadString(
        'packages/country_state_city_picker/lib/assets/country.json');
    return jsonDecode(res);
  }

  Future getCounty() async {
    var countryres = await getResponse() as List;
    countryres.forEach((data) {
      var model = StatusModel.StatusModel();
      model.name = data['name'];
      model.emoji = data['emoji'];
      if (!mounted) return;
      setState(() {
        _country.add(model.emoji! + "    " + model.name!);
      });
    });

    return _country;
  }

  Future getState() async {
    var response = await getResponse();
    var takestate = response
        .map((map) => StatusModel.StatusModel.fromJson(map))
        .where((item) => item.emoji + "    " + item.name == _selectedCountry)
        .map((item) => item.state)
        .toList();
    var states = takestate as List;
    states.forEach((f) {
      if (!mounted) return;
      setState(() {
        var name = f.map((item) => item.name).toList();
        for (var statename in name) {
          print(statename.toString());

          _states.add(statename.toString());
        }
      });
    });

    return _states;
  }

  Future getCity() async {
    var response = await getResponse();
    var takestate = response
        .map((map) => StatusModel.StatusModel.fromJson(map))
        .where((item) => item.emoji + "    " + item.name == _selectedCountry)
        .map((item) => item.state)
        .toList();
    var states = takestate as List;
    states.forEach((f) {
      var name = f.where((item) => item.name == _selectedState);
      var cityname = name.map((item) => item.city).toList();
      cityname.forEach((ci) {
        if (!mounted) return;
        setState(() {
          var citiesname = ci.map((item) => item.name).toList();
          for (var citynames in citiesname) {
            print(citynames.toString());

            _cities.add(citynames.toString());
          }
        });
      });
    });
    return _cities;
  }

  void _onSelectedCountry(String value) {
    if (!mounted) return;
    setState(() {
      _selectedState = "Choose  State/Province";
      _states = ["Choose  State/Province"];
      _selectedCountry = value;
      this.widget.onCountryChanged(value);
      getState();
    });
  }

  void _onSelectedState(String value) {
    if (!mounted) return;
    setState(() {
      _selectedCity = "Choose City";
      _cities = ["Choose City"];
      _selectedState = value;
      this.widget.onStateChanged(value);
      getCity();
    });
  }

  void _onSelectedCity(String value) {
    if (!mounted) return;
    setState(() {
      _selectedCity = value;
      this.widget.onCityChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownSearch<String>(
          items: _country,
          dropdownBuilder: (context, selectedItem) {
            return Container(
                child: selectedItem != null
                    ? SmallText(
                        text: selectedItem,
                      )
                    : Row(
                        children: [
                          Image.asset(
                            'assets/address/country.png',
                            height: 20,
                            width: 20,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          widthSpace,
                          SmallText(text: 'Choose Country'),
                        ],
                      ));
          },
          popupProps: PopupProps.menu(
            disabledItemFn: (value) => value == "Choose Country",
            showSearchBox: true,
            searchFieldProps: TextFieldProps(autofocus: true),
            // showSelectedItems: true,
          ),
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: 'Choose Country',
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          onChanged: (value) => _onSelectedCountry(value!),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: addressBorderColor,
        ),
        DropdownSearch<String>(
          items: _states,
          dropdownBuilder: (context, selectedItem) {
            return Container(
                child: selectedItem != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: SmallText(
                          text: selectedItem,
                        ),
                      )
                    : Row(
                        children: [
                          Image.asset(
                            'assets/address/state.png',
                            height: 20,
                            width: 20,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          widthSpace,
                          SmallText(text: 'Choose State')
                        ],
                      ));
          },
          popupProps: PopupProps.menu(
            disabledItemFn: (value) => value == "Choose  State/Province",
            showSearchBox: true,
            searchFieldProps: TextFieldProps(autofocus: true),
            // showSelectedItems: true,
          ),
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: 'Choose Country',
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          onChanged: (value) => _onSelectedState(value!),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: addressBorderColor,
        ),
        DropdownSearch<String>(
          items: _cities,
          dropdownBuilder: (context, selectedItem) {
            return Container(
                child: selectedItem != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: SmallText(
                          text: selectedItem,
                        ),
                      )
                    : Row(
                        children: [
                          Image.asset(
                            'assets/address/city.png',
                            height: 20,
                            width: 20,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          widthSpace,
                          SmallText(text: 'Choose City')
                        ],
                      ));
          },
          popupProps: PopupProps.menu(
            disabledItemFn: (value) => value == "Choose City",
            showSearchBox: true,
            searchFieldProps: TextFieldProps(autofocus: true),
            // showSelectedItems: true,
          ),
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: 'Choose City',
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          onChanged: (value) => _onSelectedCity(value!),
        ),
      ],
    );
  }
}
