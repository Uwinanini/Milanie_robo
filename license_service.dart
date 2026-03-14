class LicenseService {
  static bool validateKey(String key) {
    const allowedKeys = [
      'MILANIE-ROBO-2026',
      'TEST-1234',
    ];

    return allowedKeys.contains(key);
  }
}