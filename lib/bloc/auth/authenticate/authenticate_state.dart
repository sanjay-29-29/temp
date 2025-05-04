enum AuthenticationStatus { authenticated, unauthenticated }
 
class AuthenticationState {
  final AuthenticationStatus status;
 
  const AuthenticationState(this.status);
}