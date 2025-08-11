class Formatters {
  static String formatStatus(String status) {
    return status.isNotEmpty ? status[0].toUpperCase() + status.substring(1) : "";
  }
}
