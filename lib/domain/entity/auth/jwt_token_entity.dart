class JWTTokenEntity {
  final String accessToken, refreshToken;

  JWTTokenEntity({
    required this.accessToken,
    required this.refreshToken,
  });
}
