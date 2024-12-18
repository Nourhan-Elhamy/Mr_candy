abstract class Failure{

  final String errormessage;
  Failure({required this.errormessage});

}


class ApiFailure extends Failure{

  ApiFailure({required super.errormessage});


}

class NoInternetFailure extends Failure{

  NoInternetFailure({required super.errormessage});


}