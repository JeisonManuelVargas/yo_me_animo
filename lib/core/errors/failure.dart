abstract class Failure {
  late String message;
}

class DetailMovieFailure implements Failure {
  @override
  String message;

  DetailMovieFailure({this.message = ""});
}

class HomeFailure implements Failure {
  @override
  String message;

  HomeFailure({this.message = ""});
}

class RegisterFailure implements Failure {
  @override
  String message;

  RegisterFailure({this.message = ""});
}

class LoginFailure implements Failure {
  @override
  String message;

  LoginFailure({this.message = ""});
}
