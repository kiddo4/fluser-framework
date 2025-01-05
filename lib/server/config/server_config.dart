class ServerConfig {
  final String host;
  final int port;
  final bool enableSSR;
  final bool enableISR;
  final Duration ssrTimeout;
  final Duration cacheDuration;
  
  const ServerConfig({
    this.host = 'localhost',
    this.port = 8080,
    this.enableSSR = true,
    this.enableISR = true,
    this.ssrTimeout = const Duration(seconds: 5),
    this.cacheDuration = const Duration(minutes: 30),
  });
}