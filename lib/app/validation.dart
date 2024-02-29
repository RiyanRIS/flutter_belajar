// Minimal enam karakter, setidaknya satu huruf besar,
// satu huruf kecil, dan satu angka
// atau sepanjang 13 karakter
bool isValidPassword(String value) {
  if (value.length > 13) {
    return true;
  } else {
    RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}$');
    return regex.hasMatch(value);
  }
}
