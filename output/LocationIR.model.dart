class LocationModelModelIR with ModsimORM implements ModsimModel { 
  String streetAddress;  String postalCode;  String city;  String stateProvince;  LocationModel({    this.streetAddress,    this.postalCode,    this.city,    this.stateProvince,  });
  @override
  LocationModel fromJSON(Map<String, dynamic> json) => LocationModel(
    streetAddress: json[streetAddress],    postalCode: json[postalCode],    city: json[city],    stateProvince: json[stateProvince],  );
  @override
  Map<String, dynamic> toJSON() => {
    "streetAddress": streetAddress,    "postalCode": postalCode,    "city": city,    "stateProvince": stateProvince,  };
  @override
  LocationModel fromSqlite(Map<String, dynamic> json) => LocationModel(
    streetAddress: json[streetAddress],    postalCode: json[postalCode],    city: json[city],    stateProvince: json[stateProvince],  );
  @override
  Map<String, dynamic> toSqlite() => {
    "streetAddress": streetAddress,    "postalCode": postalCode,    "city": city,    "stateProvince": stateProvince,  };
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
