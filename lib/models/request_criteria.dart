import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HttpRequestInput extends Equatable {
  final String userAgentVersion;
  final String domain;
  final String uri;

  HttpRequestInput(
      {@required this.userAgentVersion,
      @required this.domain,
      @required this.uri});

  @override
  List<Object> get props => [this.userAgentVersion, this.domain, this.uri];
}

class UserAgent {
  static Map<String, String> fromType = {
    'Mobile':
        'Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25',
    'Desktop':
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36'
  };
}
