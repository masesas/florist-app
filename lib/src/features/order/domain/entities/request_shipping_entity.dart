part of 'entity.dart';

class RequestShippingEntity extends Equatable {
  final String logistic;
  final String vehicle;
  final String pickupForm;
  final String recipientAddress;
  final String recipientName;
  final String recipientContact;
  final String remark;
  final String scheduleProsses;
  final String scheduleTime;
  final String? status;
  final String? driverName;
  final String? driverPhone;
  final String? driverPlateNumb;
  final String? driverPhotoUrl;

  const RequestShippingEntity({
    required this.logistic,
    required this.vehicle,
    required this.pickupForm,
    required this.recipientAddress,
    required this.recipientName,
    required this.recipientContact,
    required this.remark,
    required this.scheduleProsses,
    required this.scheduleTime,
    this.status,
    this.driverName,
    this.driverPhone,
    this.driverPlateNumb,
    this.driverPhotoUrl,
  });

  @override
  List<Object?> get props => [
        logistic,
        vehicle,
        pickupForm,
        recipientAddress,
        recipientName,
        recipientContact,
        remark,
        scheduleProsses,
        scheduleTime,
        status,
        driverName,
        driverPhone,
        driverPlateNumb,
        driverPhotoUrl,
      ];
}
