import 'dart:io';

String readJsonAuth(String name) =>
    File('test/features/auth/json/$name').readAsStringSync();
