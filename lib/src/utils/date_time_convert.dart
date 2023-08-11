
String getTimeAgo(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp);
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  if (difference.inMinutes < 1) {
    return 'Just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays == 1) {
    return '01 day ago';
  } else {
    return '${difference.inDays} days ago';
  }
}

void main() {
  String timestamp = '2023-08-06T09:57:36.257+00:00';
  String timeAgo = getTimeAgo(timestamp);
  print(timeAgo); // Output: "2 days ago"
}
