import 'package:dio/dio.dart';
import 'package:ws2/models/register_model.dart';

class AuthRepository {
  final _dio = Dio();
  Future regitserRepository(RegisterModel _registerModel) async {
    try {
      var response = await _dio.post('https://fakestoreapi.com/users', data: {
        'email': _registerModel.email,
        'username': _registerModel.username,
        'password': _registerModel.password,
        'name': {
          'firstname': _registerModel.name.firstname,
          'lastname': _registerModel.name.lastname,
        },
        'address': {
          'city': _registerModel.address.city,
          'street': _registerModel.address.street,
          'number': _registerModel.address.number,
        },
        'phone': _registerModel.phone
      });

      if (response.statusCode == 200) {
        print("data berhasil : ${response.data}");
        return true;
      }
    } catch (eror) {
      print("there is eror ${eror.toString()}");
    }
    return false;
  }
}
