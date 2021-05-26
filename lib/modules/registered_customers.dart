import 'customer_registration.dart';

class RegisteredCustomersList {

  static List<CustomersRegistration> registeredList = [
    CustomersRegistration("Ghazaal", "Laghaee", [], "Ghazal1234", "09129494168",100000,[],[]),
  ];


  int phoneNumberExistence(String phone) {
    for (int i = 0; i < registeredList.length; i++){
      if(registeredList[i].phoneNumber.compareTo(phone) == 0)
        return i;
    }
    print(phone);
    return -1;
  }

  bool checkPassword(String password,int i){
    if (registeredList[i].password.compareTo(password) == 0)
      return true;
    return false;
  }

}