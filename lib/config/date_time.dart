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

String getTimeOfDayAsset(){
  int hour = DateTime.now().hour;
  if(hour < 18 && hour >= 6){
    return 'assets/day.png';
  }
  else{
    return 'assets/night.png';
  }
}