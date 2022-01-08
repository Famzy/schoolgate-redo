class EnvironmentConfig {
  static const BASE_URL = String.fromEnvironment('BASE_URL',
      defaultValue: "http://api.schoolgate.ng/api/");

  static const PAYSTACK_PUB_KEY = String.fromEnvironment('PAYSTACK_PUB_KEY',
      defaultValue: "pk_live_ce0a388ce3f3d7ba1ca7995b3e8138c65922679f");
}
mixin EndPoints {
  static const String login = "auth/signin";
  static const String register = "auth/register";
}

// // final String PAYSTACK_PUBLIC_KEY = "pk_test_72d51c4b84ab3e76a29b4322ec314c948bae91c8";
// final String PAYSTACK_PUBLIC_KEY = "pk_live_ce0a388ce3f3d7ba1ca7995b3e8138c65922679f";