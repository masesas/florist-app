part of 'utils.dart';

enum OrderEnum {
  NEW_ORDER,
  ACCEPTED,
  PREPARE_DELIVERY,
  DELIVERED,
}

enum SortEnum {
  NEW_TO_OLD,
  OLD_TO_NEW,
}

enum SearchEnum {
  ORDER_ID,
  CUST_NAME,
  PRODUCTS,
}

extension OrderExt on OrderEnum {
  String asStatus() {
    switch (this) {
      case OrderEnum.NEW_ORDER:
        return OrderConstants.NEW_ORDER;
      case OrderEnum.ACCEPTED:
        return OrderConstants.ACCEPTED;
      case OrderEnum.PREPARE_DELIVERY:
        return OrderConstants.PREPARE_DELIVERY;
      case OrderEnum.DELIVERED:
        return OrderConstants.DELIVERED;
    }
  }
}
