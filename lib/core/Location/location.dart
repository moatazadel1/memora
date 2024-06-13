import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:memora/core/failures/failures.dart';
@injectable
class GetCurrentLocation {
  Future<bool> requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    } else if (permission == LocationPermission.deniedForever) {
      return false;
    } else if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      return true;
    }
    print(permission);
    return true;
  }

  Future<bool> _requestService() async {
    return await Geolocator.isLocationServiceEnabled();
  }
  Future<Either<Position,Failures>> getCurrentLocation() async {
    bool permission = await requestPermission();
    if (permission == false) {
      print('----->$permission');
      return right(Locationfailure('noPermission'));
    }
    bool service = await _requestService();
    if (service == false) {
      return right(Locationfailure('noService'));
    }
    final Position location = await Geolocator.getCurrentPosition();
    return left(location);
  }
}
