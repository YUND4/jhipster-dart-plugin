class LocationModelModelIR with ModsimORM implements ModsimModel { 
  String streetAddress;
  @override
  LocationModel fromJSON(Map<String, dynamic> json) => LocationModel(
    streetAddress: json[streetAddress],
  @override
  Map<String, dynamic> toJSON() => {
    "streetAddress": streetAddress,
  @override
  LocationModel fromSqlite(Map<String, dynamic> json) => LocationModel(
    streetAddress: json[streetAddress],
  @override
  Map<String, dynamic> toSqlite() => {
    "streetAddress": streetAddress,
  save() async{
    await initDatabase();
    ResponseDB r;
    if(this.id == 0 || this.id == null){
        this.id = null;
        r = await add('Location', this);
    } else {
        r = await update('Location', this);
    }
    return r;
  }
}