enum TypeItem {
  location,
  component,
  parent,
}

enum Status {
  processing,
  alert,
  operating;

  static Status? parse({required String value}) {
    switch (value) {
      case "alert":
        return Status.alert;
      case "processing":
        return Status.processing;
      case "operating":
        return Status.operating;
      default:
        return null;
    }
  }
}

enum SensorType {
  vibration,
  energy;

  static SensorType? parse({required String value}) {
    switch (value) {
      case "energy":
        return SensorType.energy;
      case "vibration":
        return SensorType.vibration;
      default:
        return null;
    }
  }
}
