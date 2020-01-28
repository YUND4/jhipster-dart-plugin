class MaterialRetiradoModelIR with ModsimORM implements ModsimModel { 
  String nombre;
            
  @override
  int employeeId;

  @override
  bool hasChanges;

  @override
  DateTime movilToWeb;

  @override
  DateTime webToMovil;


  @override
  MaterialRetiradoModelIR fromJSON(Map<String, dynamic> json) => MaterialRetiradoModelIR(
    nombre: json["nombre"],
  @override
  Map<String, dynamic> toJSON() => {
    "nombre": nombre,
  @override
  MaterialRetiradoModelIR fromSqlite(Map<String, dynamic> json) => MaterialRetiradoModelIR(
    nombre: json["nombre"] ,
  @override
  Map<String, dynamic> toSqlite() => {
    "nombre": nombre,
  save() async{
    await initDatabase();
    ResponseDB r;
    if(this.id == 0 || this.id == null){
        this.id = null;
        r = await add('MaterialRetirado', this);
    } else {
        r = await update('MaterialRetirado', this);
    }
    return r;
  }
}