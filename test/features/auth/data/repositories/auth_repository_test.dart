import 'dart:convert';

import 'package:florist_app/src/core/utils/shared_pref_utils.dart';
import 'package:florist_app/src/features/auth/data/datasources/datasources.dart';
import 'package:florist_app/src/features/auth/data/models/models.dart';
import 'package:florist_app/src/features/auth/data/repositories/repositories.dart';
import 'package:florist_app/src/features/auth/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../json/utils.dart';

class MockAuthService extends Mock implements AuthService {}

//@GenerateNiceMocks(mocks)
void main() {
  late AuthService authRemoteDatasource;
  late AuthLocal authLocalDatasource;
  late AuthRepository authRepository;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});

    final sharePref = await SharedPreferences.getInstance();
    final sharePrefUtils = SharePrefUtils(prefs: sharePref);

    authRemoteDatasource = MockAuthService();
    authLocalDatasource = AuthLocalImpl(sharePref: sharePrefUtils);
    authRepository = AuthRepositoryImpl(
      authLocal: authLocalDatasource,
      authService: authRemoteDatasource,
    );
  });

  const loginRequest = LoginRequest(username: 'FAIT', password: 'aaaaaa');

  LoginEntity loginSuccessEntity() {
    final json = jsonDecode(readJsonAuth('login_success.json'));
    return LoginResponse.fromJson(json as Map<String, dynamic>);
  }

  LoginEntity loginFailEntity() {
    final json = jsonDecode(readJsonAuth('login_fail.json'));
    return LoginResponse.fromJson(json as Map<String, dynamic>);
  }

  group('authentication repository testing', () {
    //success login * PASSED
    test('should return [LoginEntity] with access token or means success login',
        () async {
      when(authRepository.login(
        username: loginRequest.username,
        password: loginRequest.password,
      )).thenAnswer((_) async => Future.value(loginSuccessEntity()));

      final login = await authRepository.login(
        username: loginRequest.username,
        password: loginRequest.password,
      );

      verify(authRepository.login(
        username: loginRequest.username,
        password: loginRequest.password,
      ));
      expect(login, isA<LoginEntity>());
    });
  });
}
