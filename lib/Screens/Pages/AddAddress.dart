import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_comerce/Models/LocationInfo.dart';
import 'package:e_comerce/Models/Profile.dart';
import 'package:e_comerce/Models/ProvinceInfo.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:toast/toast.dart' as toast;


class AddAddress extends StatefulWidget {
  List<AddressAddress> details;

  AddAddress({this.details});

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  bool isloading;
  TextEditingController Address_name_controller = TextEditingController();
  TextEditingController first_name_controller = TextEditingController();
  TextEditingController last_name_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  TextEditingController zip_code_controller = TextEditingController();
  String _selectedCountry_id;
  String _selectedCountry_name;
  String _selectedProvince_id;
  String _selectedProvince_name;
  LocationInfo locationInfo = LocationInfo();
  ProvinceInfo provinceInfo = ProvinceInfo();

  @override
  void initState() {
    provinceInfo.data = null;
    isloading = true;
    Api.getLocationInfo().then((value) {
      if (value.success == true) {
        locationInfo = value;
      }
      setState(() {
        isloading = false;
      });
    });
    if (widget.details != null) {
      Address_name_controller.text = widget.details[0].nameAddresses.toString();
      first_name_controller.text = widget.details[0].firstName.toString();
      last_name_controller.text = widget.details[0].lastName.toString();
      last_name_controller.text = widget.details[0].lastName.toString();
      phone_controller.text = widget.details[0].phone.toString();
      zip_code_controller.text = widget.details[0].zipCode.toString();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body:  isloading == true
            ? Loading():locationInfo != null
                ? SafeArea(
                  child: Stack(
                      children: [
                        Column(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 30.0, top: 30),
                                child: widget.details == null
                                    ? Text(
                                        'Add New Address',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        'Edit Address',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )),
                            Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*.75
                               , child: ListView(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: TextField(
                                    controller: Address_name_controller,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: "Address Name",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 18)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: TextField(
                                    controller: first_name_controller,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: "First Name",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 18)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: TextField(
                                    controller: last_name_controller,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: "Last Name",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 18)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 0, right: 20, left: 20),
                                  child: IntlPhoneField(
                                    controller: phone_controller,
                                    decoration: InputDecoration(
                                      labelText: 'Phone Number',
                                    ),
                                    initialCountryCode: 'DZ',
                                    onChanged: (phone) {},
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40.0, right: 40, top: 20, bottom: 20),
                                  child: DropdownButton(
                                    hint: Text('Please choose your country'),
                                    iconEnabledColor: Colors.red,
                                    isExpanded: true,
                                    // Not necessary for Option 1
                                    value: _selectedCountry_id,
                                    onChanged: (newValue) {
                                      setState(() {
                                        isloading = true;
                                        _selectedCountry_id = null;
                                        _selectedProvince_id = null;
                                        _selectedCountry_id = newValue;
                                      });
                                      Api.getprovince(_selectedCountry_id)
                                          .then((value) {
                                        isloading = false;
                                        if (value.success == true) {
                                          setState(() {
                                            provinceInfo = value;
                                          });
                                        }
                                      });
                                    },
                                    items: locationInfo.data.countries
                                        .map((location) {
                                      return DropdownMenuItem(
                                        child: new Text(location.countryName),
                                        value: location.id,
                                        onTap: () {
                                          setState(() {
                                            _selectedCountry_name =
                                                location.countryName;
                                          });
                                        },
                                      );
                                    }).toList()
                                  ),
                                ),
                                // provinceInfo.data!=null?
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40.0, right: 40, top: 20, bottom: 20),
                                  child: DropdownButton(
                                      hint: Text('Please choose your province'),
                                      iconEnabledColor: Colors.red,
                                      isExpanded: true,
                                      // Not necessary for Option 1
                                      value: _selectedProvince_id,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedProvince_id = newValue;
                                        });
                                      },
                                      items: provinceInfo.data == null
                                          ? []
                                          : provinceInfo.data.provinces
                                              .map((locations) {
                                              return DropdownMenuItem(
                                                child:
                                                    new Text(locations.province),
                                                value: locations.id,
                                                onTap: () {
                                                  setState(() {
                                                    _selectedProvince_name =
                                                        locations.province;
                                                  });
                                                },
                                              );
                                            }).toList()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Padding(
                                    padding:  EdgeInsets.only(
                                        bottom: MediaQuery.of(context).viewInsets.bottom
                                    ),
                                    child: TextField(
                                      controller: zip_code_controller,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          hintText: "ZIP Code",
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 18)),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                        Positioned(
                          top: 30,
                          left: 30,
                          child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                              )),
                        ),
                        Positioned(
                            bottom: 0,
                            child: InkWell(
                                onTap: () {
                                  if (widget.details == null) {
                                    setState(() {
                                      isloading = true;
                                    });
                                    Api.AddProvince(
                                            Address_name_controller.text,
                                            first_name_controller.text,
                                            last_name_controller.text,
                                            int.parse(phone_controller.text),
                                            _selectedCountry_id,
                                            _selectedProvince_id,
                                            _selectedCountry_name,
                                            _selectedProvince_name,
                                            zip_code_controller.text)
                                        .then((value) {
                                      setState(() {
                                        isloading = false;
                                      });
                                      if (value == 200) {
                                        showToast('Address has added successfully');
                                        Navigator.of(context).pop(true);

                                      } else {
                                        showToast('Something went wrong try again!');
                                      }
                                    });
                                  } else {
                                    Api.EditAddress(
                                            Address_name_controller.text,
                                            first_name_controller.text,
                                            last_name_controller.text,
                                            int.parse(phone_controller.text),
                                            _selectedCountry_id,
                                            _selectedProvince_id,
                                            _selectedCountry_name,
                                            _selectedProvince_name,
                                            zip_code_controller.text,
                                            widget.details[0].id)
                                        .then((value) {
                                      setState(() {
                                        isloading = false;
                                      });
                                      if (value == 200||value==202) {
                                        AwesomeDialog(
                                          btnOkColor: Colors.green,
                                          context: context,
                                          animType: AnimType.SCALE,
                                          dialogType: DialogType.SUCCES,
                                          body: Center(
                                            child: Text(
                                              'Address is Updated',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(),
                                            ),
                                          ),
                                          title: '',
                                          desc: '',
                                          btnOkOnPress: () {Navigator.of(context).pop(true);},
                                        ).show();
                                      } else {
                                        print('there is error');
                                      }
                                    });
                                  }
                                },
                                child: Container(

                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                      child: widget.details == null
                                          ? Text(
                                              'Add Address',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : Text(
                                              'Edit Address',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                  height: 60,
                                  color: Colors.red,
                                ))),

                      ],
                    ),
                )
                : Container(
                    child: Text('there is Error'),
                  ));
  }

  void showToast(String msg, {int duration, int gravity}) {
   toast.Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
