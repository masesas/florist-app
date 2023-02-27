import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:florist_app/src/core/network/network.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

/// * TEST PASSED
@GenerateNiceMocks([MockSpec<Connectivity>()])
void main() {
  late NetworkInfo networkInfo;
  late Connectivity connectivity;

  setUp(() {
    connectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(connectivity: connectivity);
  });

  group('connectivity', () {
    test(
        'should call connectivity.checkConnectivity and return true if result is wifi / mobile, else return false',
        () async {
      when(connectivity.checkConnectivity()).thenAnswer((_) async {
        return Future.value(ConnectivityResult.wifi);
      });

      final result = await networkInfo.isConnected();

      //assert
      verify(connectivity.checkConnectivity());
      expect(result, true);
    });

    test('should none connectivity', () async {
      when(connectivity.checkConnectivity()).thenAnswer((_) async {
        return Future.value(ConnectivityResult.none);
      });

      final result = await networkInfo.connectivityResult;
      verify(connectivity.checkConnectivity());
      expect(result, ConnectivityResult.none);
    });
  });
}
