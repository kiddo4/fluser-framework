class FrameworkConstants {
  static const String VERSION = '0.0.1';
  static const String STATE_SCRIPT_ID = '__FLUSER_STATE__';
  static const String HYDRATION_SCRIPT_ID = '__FLUSER_HYDRATION__';
  static const Duration SSR_TIMEOUT = Duration(seconds: 5);
  static const Duration CACHE_DURATION = Duration(minutes: 30);
  
  static const Map<String, String> DEFAULT_META_TAGS = {
    'charset': 'utf-8',
    'viewport': 'width=device-width, initial-scale=1',
  };
}