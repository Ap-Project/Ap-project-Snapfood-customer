import 'package:flutter/material.dart';
import 'bottom_tabs.dart';
import 'package:customer_app/modules/registered_customers.dart';
import 'package:common_codes/modules/identity_information.dart';
import 'package:common_codes/screens/decoration.dart';


const backgroundColor = Colors.white;

class LoginScreen extends StatefulWidget {
  static String loginScreenId = '/LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  RegisteredCustomersList registeredCustomersList = new RegisteredCustomersList();
  IdentityInformation identityInformation = new IdentityInformation();
  bool _obscureText = true;
  IconData obscurePasswordIcon = Icons.check_box_outline_blank;
  String obscurePasswordText = 'show password';
  int countIconChanges = 0;
  int indexInRestaurantList = 0;

  void _toggle(){
    setState(() {
      _obscureText = ! _obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: myDecoration.TextFormFieldDecoration(
                  'Enter your phone number',
                  'phone number',
                ),
                onSaved: (String value) {
                  identityInformation.phoneNumber = value;
                  indexInRestaurantList = registeredCustomersList.phoneNumberExistence(value);
                },
                validator: (value) {
                  if (value.isEmpty || value == null)
                    return 'please enter your phone number';
                  else if (!identityInformation.validPhoneNumber(value))
                    return 'Invalid phone number!';
                  else if (registeredCustomersList.phoneNumberExistence(
                      value) == -1) return 'this phone number hasn\'t registered yet';
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
                  else if(!registeredCustomersList.checkPassword(value, indexInRestaurantList)){
                    print(value);
                    print(identityInformation.phoneNumber);
                    return 'Incorrect password';
                  }
                  return null;
                },
                obscureText: _obscureText,
              ),
              ListTile(
                leading: Icon(obscurePasswordIcon),
                title: Text(obscurePasswordText),
                onTap: (){
                  setState(() {
                    if(countIconChanges == 0){
                      obscurePasswordIcon = Icons.check_box_outlined;
                      obscurePasswordText = 'hide password';
                      countIconChanges = 1;
                    }
                    else{
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
                      'Log in',
                    ),
                    minWidth: 200.0,
                    height: 42.0,
                    onPressed: () {
                      // if (_formKey.currentState.validate()) {
                      //   setState(() {
                      //     _formKey.currentState.save();
                      //   });
                        Navigator.pushNamed(
                            context, BottomTabs.bottomTabsId);
                      // }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
