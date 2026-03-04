bool isEmailValid(String email) {
  return RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(email);
}

bool isEgyptianPhone(String number) {
  return RegExp(r'^01[0125][0-9]{8}$').hasMatch(number);
}

bool isName(String name) {
  return RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$').hasMatch(name);
}

bool isPassword(String password) {
  return RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}$').hasMatch(password);
} 
bool isConfirmPassword(String password, String confirmPassword) {
  return password == confirmPassword;
}

