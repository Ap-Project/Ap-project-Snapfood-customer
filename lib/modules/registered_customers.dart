import 'customer_registration.dart';

class RegisteredCustomersList {
  List<CustomersRegistration> _registeredList = [
    // CustomersRegistration('sdgegh','sdgf',,'09129494168','ghazal1234'),
  ];

  void add(CustomersRegistration c) {
    _registeredList.add(c);
  }

  List<CustomersRegistration> getRegisteredList() {
    return _registeredList;
  }

  int phoneNumberExistence(String phone) {
    for (int i = 0; i < _registeredList.length; i++){
      if(_registeredList[i].phoneNumber.compareTo(phone) == 0)
        return i;
    }
    print(phone);
    return -1;
  }
  bool checkPassword(String password,int i){
    if (_registeredList[i].password.compareTo(password) == 0)
      return true;
    return false;
  }

}