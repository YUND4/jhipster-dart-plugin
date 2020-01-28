class JobModel with ModsimORM implements ModsimModel { 
  String jobTitle;  int minSalary;  int maxSalary;  DateTime date;  bool exist;  JobModel({    this.jobTitle,    this.minSalary,    this.maxSalary,    this.date,    this.exist,  });
  @override
  JobModel fromJSON(Map<String, dynamic> json) => JobModel(
    jobTitle: json["jobTitle"],    minSalary: json["minSalary"],    maxSalary: json["maxSalary"],    date: json["date"],    exist: json["exist"],  );
  @override
  Map<String, dynamic> toJSON() => {
    "jobTitle": jobTitle,    "minSalary": minSalary,    "maxSalary": maxSalary,    "date": date is DateTime ? "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}T${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}-05:00" : null,    "exist": exist,  };
  @override
  JobModel fromSqlite(Map<String, dynamic> json) => JobModel(
    jobTitle: json["jobTitle"] ,    minSalary: json["minSalary"] ,    maxSalary: json["maxSalary"] ,    date: json["date"]  is String ? DateTime.parse(json["date"]) : json["date"],    exist: json["exist"]  = (json["exist"]  == null || json["exist"] == 0) ? false : true,  );
  @override
  Map<String, dynamic> toSqlite() => {
    "jobTitle": jobTitle,    "minSalary": minSalary,    "maxSalary": maxSalary,    "date": date is DateTime ? "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}T${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}-05:00" : null,    "exist": exist == true ? 1 : 0,  };
  save() async{
    await initDatabase();
    ResponseDB r;
    if(this.id == 0 || this.id == null){
        this.id = null;
        r = await add('Job', this);
    } else {
        r = await update('Job', this);
    }
    return r;
  }
}
