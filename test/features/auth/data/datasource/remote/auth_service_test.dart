import 'dart:convert';

import 'package:florist_app/src/features/auth/data/datasources/datasources.dart';
import 'package:florist_app/src/features/auth/data/models/login_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../json/utils.dart';
import 'auth_service_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthService>(),
])
void main() {
  late AuthService authService;

  setUp(() {
    authService = MockAuthService();
  });

  const loginRequest = LoginRequest(username: 'FAIT', password: 'aaaaaa');

  group('''auth remote datasource test 
  will test success return or error return
  ''', () {
    // success response * PASSED
    test('should return access token and success 200', () async {
      LoginResponse loginSuccessResponse() {
        final jsonSuccess = jsonDecode(readJsonAuth('login_success.json'));
        return LoginResponse.fromJson(jsonSuccess as Map<String, dynamic>);
      }

      /*  when(authService.login(loginRequest))
          .thenAnswer((_) => Future.value(loginSuccessResponse()));*/

      final result = await authService.login(loginRequest);

      verify(authService.login(loginRequest));
      expect(result, loginSuccessResponse());
    });

    // fail response * PASSED
    test('should return error = "1" with message object', () async {
      LoginResponse loginFailResponse() {
        final json = jsonDecode(readJsonAuth('login_fail.json'));
        return LoginResponse.fromJson(json as Map<String, dynamic>);
      }

      /* when(authService.login(loginRequest))
          .thenAnswer((_) => Future.value(loginFailResponse()));*/

      final result = await authService.login(loginRequest);

      verify(authService.login(loginRequest));
      expect(result, loginFailResponse());
    });
  });
}
