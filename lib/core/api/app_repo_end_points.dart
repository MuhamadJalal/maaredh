class AppRepoEndpoints {
  AppRepoEndpoints._internal();

  static final AppRepoEndpoints _instance = AppRepoEndpoints._internal();

  factory AppRepoEndpoints() => _instance;

  /// ================== App APIs ==================

  /// ================== Auth API ==================
  // ---- Forgot Password API ----
  // Body: form-data  ==> 'email'
  final String postForgotPasswordApi = 'password/email';

  // ---- reset password API ----
  // Body: form-data  ==> 'code' && 'password' && 'password_confirmation'
  final String postResetPasswordApi = 'password/reset';

  // ---- Login API ----
  // Body: form-data  ==> 'email' && 'password' && 'type'
  final String postLoginApi = 'login';

  // ---- logout API ----
  final String postLogoutApi = 'logout';

  // ---- register API ----
  // Body: form-data  ==> 'name' && .....
  final String postRegisterApi = 'register';

  // ---- ChangePassword API ----
  // Body: form-data  ==> 'old_password' && 'new_password' && 'new_password_confirmation'
  final String postChangePasswordApi = 'reset-password';

  /// ================== Orders API ==================
  // ---- postRequestTitle API ----
  // Body: type && params
  final String postRequestTitleApi = 'checkout';

  // ---- getRequestTitle API ----
  final String getRequestTitleApi = '';

  // ---- getParams Title API ----
  String getParamsApi(orderId) => 'endpoint/$orderId';

  // ---- postParams Title API ----
  //
  String postParamsApi(orderId) => 'endpoint/$orderId';
}
