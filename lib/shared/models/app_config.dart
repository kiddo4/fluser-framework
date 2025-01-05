class AppConfig {
  final String appName;
  final String version;
  final Map<String, dynamic> settings;
  
  AppConfig({
    required this.appName,
    required this.version,
    required this.settings,
  });
  
  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      appName: json['appName'] as String,
      version: json['version'] as String,
      settings: json['settings'] as Map<String, dynamic>,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'appName': appName,
      'version': version,
      'settings': settings,
    };
  }
}