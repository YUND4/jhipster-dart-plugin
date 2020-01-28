class MaterialRetiradoModelIR with ModsimORM implements ModsimModel { 
  String nombre;  int estado;  int id;  int idRemoto;  bool imagenesSync;  bool guardadoLocal;  MaterialRetiradoModelIR({    this.nombre,    this.estado,    this.id,    this.idRemoto,    this.imagenesSync,    this.guardadoLocal,  });
            
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
    nombre: json["nombre"],    estado: json["estado"],    id: json["id"],    idRemoto: json["idRemoto"],    imagenesSync: json["imagenesSync"],    guardadoLocal: json["guardadoLocal"],  );
  @override
  Map<String, dynamic> toJSON() => {
    "nombre": nombre,    "estado": estado,    "id": id,    "idRemoto": idRemoto,    "imagenesSync": imagenesSync,    "guardadoLocal": guardadoLocal,  };
  @override
  MaterialRetiradoModelIR fromSqlite(Map<String, dynamic> json) => MaterialRetiradoModelIR(
    nombre: json["nombre"] ,    estado: json["estado"] ,    id: json["id"] ,    idRemoto: json["idRemoto"] ,    imagenesSync: json["imagenesSync"]  = (json["imagenesSync"]  == null || json["imagenesSync"] == 0) ? false : true,    guardadoLocal: json["guardadoLocal"]  = (json["guardadoLocal"]  == null || json["guardadoLocal"] == 0) ? false : true,  );
  @override
  Map<String, dynamic> toSqlite() => {
    "nombre": nombre,    "estado": estado,    "id": id,    "idRemoto": idRemoto,    "imagenesSync": imagenesSync == true ? 1 : 0,    "guardadoLocal": guardadoLocal == true ? 1 : 0,  };
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
