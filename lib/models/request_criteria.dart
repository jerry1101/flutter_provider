
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
