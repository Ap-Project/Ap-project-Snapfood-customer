import 'package:customer_app/modules/registered_customers.dart';
import 'package:flutter/material.dart';
import 'bottom_tabs.dart';
import 'package:common_codes/modules/identity_information.dart';
import 'package:common_codes/screens/decoration.dart';


const backgroundColor = Colors.white;
const buttonColor = const Color(0XFFd83e56);

class CustomersRegistrationScreen extends StatefulWidget {
  static String customersRegistrationId = '/CustomersRegistration';
  @override
  _CustomersRegistrationScreenState createState() => _CustomersRegistrationScreenState();
}

class _CustomersRegistrationScreenState extends State<CustomersRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  RegisteredCustomersList registeredCustomersList = new RegisteredCustomersList();
  IdentityInformation identityInformation = new IdentityInformation();
  String name;
  String lastName;
  String address;
  bool _obscureText = true;
  IconData obscurePasswordIcon = Icons.check_box_outline_blank;
  String obscurePasswordText = 'show password';
  int countIconChanges = 0;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: myDecoration.TextFormFieldDecoration(
                      'Enter your name', 'name'),
                  onSaved: (String value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || value == null)
                      return 'please enter your name';
                    return null;
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  decoration: myDecoration.TextFormFieldDecoration(
                      'Enter your last name', 'last name'),
                  onSaved: (String value) {
                    lastName = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || value == null)
                      return 'please enter your last name';
                    return null;
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: myDecoration.TextFormFieldDecoration(
                      'Enter your restaurant address', 'restaurant address'),
                  onSaved: (String value) {
                    address = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || value == null)
                      return 'please enter your restaurant address';
                    return null;
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: myDecoration.TextFormFieldDecoration(
                    'Enter your phone number',
                    'phone number',
                  ),
                  onSaved: (String value) {
                    identityInformation.phoneNumber = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || value == null)
                      return 'please enter your phone number';
                    else if (!identityInformation.validPhoneNumber(value))
                      return 'Invalid phone number!';
                    else if (registeredCustomersList.phoneNumberExistence (
                    value)
                    != -1) return 'this phone number already exist';
                    return null;
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  decoration: myDecoration.TextFormFieldDecoration(
                      'Enter your password', 'password'),
                  onSaved: (String value) {
                    identityInformation.password = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || value == null)
                      return 'please enter your chosen password';
                    else if (!identityInformation.validPassword(value))
                      return 'Invalid password your password should be more than 6 letters and consist of alphabets and numbers';
                    return null;
                  },
                  obscureText: _obscureText,
                ),
                ListTile(
                  leading: Icon(obscurePasswordIcon),
                  title: Text(obscurePasswordText),
                  onTap: () {
                    setState(() {
                      if (countIconChanges == 0) {
                        obscurePasswordIcon = Icons.check_box_outlined;
                        obscurePasswordText = 'hide password';
                        countIconChanges = 1;
                      }
                      else {
                        obscurePasswordIcon = Icons.check_box_outline_blank;
                        obscurePasswordText = 'show password';
                        countIconChanges = 0;
                      }
                      _toggle();
                    });
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Material(
                    color: buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: MaterialButton(
                      child: Text(
                        'Register',
                      ),
                      minWidth: 200.0,
                      height: 42.0,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            _formKey.currentState.save();
                            // registeredRestaurantList.add(RestaurantRegistration(
                            //     name,
                            //     address,
                            //     FoodCategories.CASUAL_RESTAURANT,
                            //     identityInformation.phoneNumber,
                            //     identityInformation.password));
                          });
                          Navigator.pushNamed(
                              context, BottomTabs.bottomTabsId);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}