import 'package:equatable/equatable.dart';
import 'package:excel_native/services/auth/drift_db.dart';

class CampLocalData extends Equatable {
  final int campId;
  final String location;

  const CampLocalData({
    required this.campId,
    required this.location,
  });
  factory CampLocalData.fromCamp(Camp camp) {
    return CampLocalData(
      campId: camp.id,
      location: camp.location,
    );
  }
  @override
  List<Object?> get props => [campId, location];
}
