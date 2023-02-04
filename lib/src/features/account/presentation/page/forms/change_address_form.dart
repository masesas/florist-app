part of 'forms.dart';

class ChangeAddressForm {
  static const String ADDRESS = "address";
  static const String LATITUDE = "latitude";
  static const String LONGITUDE = "longitude";

  static Map<String, AbstractControl<dynamic>> address = {
    ADDRESS: FormControl<String>(validators: [])
  };
  static Map<String, AbstractControl<dynamic>> latitude = {
    LATITUDE: FormControl<String>(validators: [])
  };
  static Map<String, AbstractControl<dynamic>> longitude = {
    LONGITUDE: FormControl<String>(validators: [])
  };
}
