class JobModel with ModsimORM implements ModsimModel { 

  String jobTitle;
  int minSalary;
  int maxSalary;

  JobModel({
    this.jobTitle,
    this.minSalary,
    this.maxSalary,
  });

  @override
  JobModel fromJSON(Map<String, dynamic> json) => JobModel(
    jobTitle: json[jobTitle],
    minSalary: json[minSalary],
    maxSalary: json[maxSalary],
  );

  @override
  Map<String, dynamic> toJSON() => {
    "jobTitle": jobTitle,
    "minSalary": minSalary,
    "maxSalary": maxSalary,
  };

  @override
  JobModel fromSqlite(Map<String, dynamic> json) => JobModel(
    jobTitle: json[jobTitle],
    minSalary: json[minSalary],
    maxSalary: json[maxSalary],
  );

  @override
  Map<String, dynamic> toSqlite() => {
    "jobTitle": jobTitle,
    "minSalary": minSalary,
    "maxSalary": maxSalary,
  };

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
