class JobModelIR with ModsimORM implements ModsimModel { 
  String jobTitle;
  @override
  JobModelIR fromJSON(Map<String, dynamic> json) => JobModelIR(
    jobTitle: json["jobTitle"],
  @override
  Map<String, dynamic> toJSON() => {
    "jobTitle": jobTitle,
  @override
  JobModelIR fromSqlite(Map<String, dynamic> json) => JobModelIR(
    jobTitle: json["jobTitle"] ,
  @override
  Map<String, dynamic> toSqlite() => {
    "jobTitle": jobTitle,
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