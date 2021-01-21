class ScheduleKma {
  String task;
  bool success;
  String studentId;
  String name;
  String className;
  String major;
  List<Schedule> schedule;

  ScheduleKma(
      {this.task,
      this.success,
      this.studentId,
      this.name,
      this.className,
      this.major,
      this.schedule});

  ScheduleKma.fromJson(Map<String, dynamic> json) {
    task = json['task'];
    success = json['success'];
    studentId = json['student_id'];
    name = json['name'];
    className = json['class_name'];
    major = json['major'];
    if (json['schedule'] != null) {
      schedule = new List<Schedule>();
      json['schedule'].forEach((v) {
        schedule.add(new Schedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task'] = this.task;
    data['success'] = this.success;
    data['student_id'] = this.studentId;
    data['name'] = this.name;
    data['class_name'] = this.className;
    data['major'] = this.major;
    if (this.schedule != null) {
      data['schedule'] = this.schedule.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedule {
  int date;
  List<Lessons> lessons;

  Schedule({this.date, this.lessons});

  Schedule.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['lessons'] != null) {
      lessons = new List<Lessons>();
      json['lessons'].forEach((v) {
        lessons.add(new Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.lessons != null) {
      data['lessons'] = this.lessons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lessons {
  String lesson;
  String subjectName;
  String address;

  Lessons({this.lesson, this.subjectName, this.address});

  Lessons.fromJson(Map<String, dynamic> json) {
    lesson = json['lesson'];
    subjectName = json['subject_name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lesson'] = this.lesson;
    data['subject_name'] = this.subjectName;
    data['address'] = this.address;
    return data;
  }
}
