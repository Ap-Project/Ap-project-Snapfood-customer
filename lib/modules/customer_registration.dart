
class CustomersRegistration{
  String _name;
  String _lastName;
  List<String> _addresses;
  String phoneNumber;
  String password;
  CustomersRegistration(this._name,this._lastName,this._addresses,this.password,this.phoneNumber);

  void addAddress(String address){
    _addresses.add(address);
  }

}