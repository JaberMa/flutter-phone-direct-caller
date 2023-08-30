import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPhoneDirectCaller {
  static const MethodChannel _channel =
      MethodChannel('flutter_phone_direct_caller');

  static Future<bool?> callNumber(String number) async {
    return await _channel.invokeMethod(
      'callNumber',
      <String, Object>{
        'number': number,
      },
    );
  }

  static Future<CallDetails?> getCallDetails() async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('getCallDetails');
    return CallDetails.fromMap(result);
  }
}

class CallDetails {
  final String? duration;

  CallDetails({this.duration});

  factory CallDetails.fromMap(Map<dynamic, dynamic> map) {
    return CallDetails(
      duration: map['duration'],
    );
  }
}
