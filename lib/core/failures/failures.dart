class Failures{
  String message;

  Failures(this.message);
}
class RemoteFailure extends Failures{
  RemoteFailure(super.message);
}
class LocalFailure extends Failures{
  LocalFailure(super.message);
}
class Locationfailure extends Failures{
  Locationfailure(super.message);
}