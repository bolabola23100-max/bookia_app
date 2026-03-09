class VerificationParams {
  String? email;
  String? verifyCode;
  String? newPasswordConfirmation;
  String? newPassword;
  VerificationParams({
    this.email,
    this.verifyCode,
    this.newPassword,
    this.newPasswordConfirmation,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'verifyCode': verifyCode,
    "newPassword": newPassword,
    "newPasswordConfirmation": newPasswordConfirmation,
  };
}
