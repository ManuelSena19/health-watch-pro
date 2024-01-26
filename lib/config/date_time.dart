String introText() {
  int hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning,';
  } else if (hour >= 12 && hour < 18) {
    return 'Good Afternoon,';
  } else {
    return 'Good evening,';
  }
}