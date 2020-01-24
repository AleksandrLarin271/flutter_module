class Work{
  var hours;
  var minute;
  var daily_earnings;
  var note;

  Work(this.hours,this.minute, this.daily_earnings, this.note);
  Work.nothing();
  @override
  String toString() {
    return 'Work{hours: $hours, minute: $minute, daily_earnings: $daily_earnings, note: $note}';
  }


}