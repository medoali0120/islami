abstract class AuthExpetions implements Exception {
  final String message;
  const AuthExpetions({required this.message});
}

class RemoteException extends AuthExpetions {
  RemoteException({required super.message});
}

class LocalException extends AuthExpetions {
  LocalException({required super.message});
}
