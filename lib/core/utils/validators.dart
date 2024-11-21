/// Form validasyonları için yardımcı metotlar
abstract class Validators {
  // Boş alan kontrolü
  static String? validateNotEmpty(String? value, [String? message]) {
    if (value == null || value.isEmpty) {
      return message ?? 'Bu alan boş bırakılamaz';
    }
    return null;
  }

  // Email kontrolü
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return null;

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Geçerli bir email adresi girin';
    }
    return null;
  }

  // Sayı kontrolü
  static String? validateNumber(String? value, {int? min, int? max}) {
    if (value == null || value.isEmpty) return null;

    final number = int.tryParse(value);
    if (number == null) {
      return 'Geçerli bir sayı girin';
    }

    if (min != null && number < min) {
      return '$min değerinden büyük bir sayı girin';
    }

    if (max != null && number > max) {
      return '$max değerinden küçük bir sayı girin';
    }

    return null;
  }
}
