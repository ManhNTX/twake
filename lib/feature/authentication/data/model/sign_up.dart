import 'package:json_annotation/json_annotation.dart';

part 'sign_up.g.dart';

@JsonSerializable(explicitToJson: true)
class SignUpRequestBody {
  final String email;
  final String name;
  final String companyName;
  final String password;
  final String locale;
  final String secretToken;
  final String captchaResponseToken;

  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestBodyFromJson(json);

  SignUpRequestBody(
    this.email,
    this.name,
    this.companyName,
    this.password,
    this.locale,
    this.secretToken,
    this.captchaResponseToken,
  );

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignUpRequestQueryParameters {
  final bool createAccountOnly;

  factory SignUpRequestQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestQueryParametersFromJson(json);

  SignUpRequestQueryParameters(this.createAccountOnly);

  Map<String, dynamic> toJson() => _$SignUpRequestQueryParametersToJson(this);
}
