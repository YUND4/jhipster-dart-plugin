class MaterialSuspensionIRModelIR with ModsimORM implements ModsimModel { 
  bool transmittedToServer;
  String firma;
  DateTime ultimaSincronizacion;
  bool realizado;
  String tipoPredio;
  int funcionarioId;
  String funcionarioNombre;
  String createdBy;
  DateTime createdDate;
  String lastModifiedBy;
  DateTime lastModifiedDate;
  int id;
  int cantidad;
  int accion;
  int propiedad;
  int suspensionId;
  int materialRetiradoId;
  String materialRetiradoNombre;
  bool transmittedToMovil;
  int idRemoto;
  bool imagenesSync;
  bool guardadoLocal;

  MaterialSuspensionIRModelIR({
    this.transmittedToServer,
    this.firma,
    this.ultimaSincronizacion,
    this.realizado,
    this.tipoPredio,
    this.funcionarioId,
    this.funcionarioNombre,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.id,
    this.cantidad,
    this.accion,
    this.propiedad,
    this.suspensionId,
    this.materialRetiradoId,
    this.materialRetiradoNombre,
    this.transmittedToMovil,
    this.idRemoto,
    this.imagenesSync,
    this.guardadoLocal,
  });
            
  @override
  int employeeId;

  @override
  bool hasChanges;

  @override
  DateTime movilToWeb;

  @override
  DateTime webToMovil;


  @override
  MaterialSuspensionIRModelIR fromJSON(Map<String, dynamic> json) => MaterialSuspensionIRModelIR(
    transmittedToServer: json["transmittedToServer"],
    firma: json["firma"],
    ultimaSincronizacion: json["ultimaSincronizacion"],
    realizado: json["realizado"],
    tipoPredio: json["tipoPredio"],
    funcionarioId: json["funcionarioId"],
    funcionarioNombre: json["funcionarioNombre"],
    createdBy: json["createdBy"],
    createdDate: json["createdDate"],
    lastModifiedBy: json["lastModifiedBy"],
    lastModifiedDate: json["lastModifiedDate"],
    id: json["id"],
    cantidad: json["cantidad"],
    accion: json["accion"],
    propiedad: json["propiedad"],
    suspensionId: json["suspensionId"],
    materialRetiradoId: json["materialRetiradoId"],
    materialRetiradoNombre: json["materialRetiradoNombre"],
    transmittedToMovil: json["transmittedToMovil"],
    id: json["id"],
    idRemoto: json["idRemoto"],
    imagenesSync: json["imagenesSync"],
    guardadoLocal: json["guardadoLocal"],
  );
  @override
  Map<String, dynamic> toJSON() => {
    "transmittedToServer": transmittedToServer,
    "firma": firma,
    "ultimaSincronizacion": ultimaSincronizacion is DateTime ? "${ultimaSincronizacion.year.toString().padLeft(4, '0')}-${ultimaSincronizacion.month.toString().padLeft(2, '0')}-${ultimaSincronizacion.day.toString().padLeft(2, '0')}T${ultimaSincronizacion.hour.toString().padLeft(2, '0')}:${ultimaSincronizacion.minute.toString().padLeft(2, '0')}:${ultimaSincronizacion.second.toString().padLeft(2, '0')}-05:00" : null,
    "realizado": realizado,
    "tipoPredio": tipoPredio,
    "funcionarioId": funcionarioId,
    "funcionarioNombre": funcionarioNombre,
    "createdBy": createdBy,
    "createdDate": createdDate is DateTime ? "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}T${createdDate.hour.toString().padLeft(2, '0')}:${createdDate.minute.toString().padLeft(2, '0')}:${createdDate.second.toString().padLeft(2, '0')}-05:00" : null,
    "lastModifiedBy": lastModifiedBy,
    "lastModifiedDate": lastModifiedDate is DateTime ? "${lastModifiedDate.year.toString().padLeft(4, '0')}-${lastModifiedDate.month.toString().padLeft(2, '0')}-${lastModifiedDate.day.toString().padLeft(2, '0')}T${lastModifiedDate.hour.toString().padLeft(2, '0')}:${lastModifiedDate.minute.toString().padLeft(2, '0')}:${lastModifiedDate.second.toString().padLeft(2, '0')}-05:00" : null,
    "id": id,
    "cantidad": cantidad,
    "accion": accion,
    "propiedad": propiedad,
    "suspensionId": suspensionId,
    "materialRetiradoId": materialRetiradoId,
    "materialRetiradoNombre": materialRetiradoNombre,
    "transmittedToMovil": transmittedToMovil,
    "id": id,
    "idRemoto": idRemoto,
    "imagenesSync": imagenesSync,
    "guardadoLocal": guardadoLocal,
  };
  @override
  MaterialSuspensionIRModelIR fromSqlite(Map<String, dynamic> json) => MaterialSuspensionIRModelIR(
    transmittedToServer: json["transmittedToServer"]  = (json["transmittedToServer"]  == null || json["transmittedToServer"] == 0) ? false : true,
    firma: json["firma"] ,
    ultimaSincronizacion: json["ultimaSincronizacion"]  is String ? DateTime.parse(json["ultimaSincronizacion"]) : json["ultimaSincronizacion"],
    realizado: json["realizado"]  = (json["realizado"]  == null || json["realizado"] == 0) ? false : true,
    tipoPredio: json["tipoPredio"] ,
    funcionarioId: json["funcionarioId"] ,
    funcionarioNombre: json["funcionarioNombre"] ,
    createdBy: json["createdBy"] ,
    createdDate: json["createdDate"]  is String ? DateTime.parse(json["createdDate"]) : json["createdDate"],
    lastModifiedBy: json["lastModifiedBy"] ,
    lastModifiedDate: json["lastModifiedDate"]  is String ? DateTime.parse(json["lastModifiedDate"]) : json["lastModifiedDate"],
    id: json["id"] ,
    cantidad: json["cantidad"] ,
    accion: json["accion"] ,
    propiedad: json["propiedad"] ,
    suspensionId: json["suspensionId"] ,
    materialRetiradoId: json["materialRetiradoId"] ,
    materialRetiradoNombre: json["materialRetiradoNombre"] ,
    transmittedToMovil: json["transmittedToMovil"]  = (json["transmittedToMovil"]  == null || json["transmittedToMovil"] == 0) ? false : true,
    id: json["id"] ,
    idRemoto: json["idRemoto"] ,
    imagenesSync: json["imagenesSync"]  = (json["imagenesSync"]  == null || json["imagenesSync"] == 0) ? false : true,
    guardadoLocal: json["guardadoLocal"]  = (json["guardadoLocal"]  == null || json["guardadoLocal"] == 0) ? false : true,
  );
  @override
  Map<String, dynamic> toSqlite() => {
    "transmittedToServer": transmittedToServer == true ? 1 : 0,
    "firma": firma,
    "ultimaSincronizacion": ultimaSincronizacion is DateTime ? "${ultimaSincronizacion.year.toString().padLeft(4, '0')}-${ultimaSincronizacion.month.toString().padLeft(2, '0')}-${ultimaSincronizacion.day.toString().padLeft(2, '0')}T${ultimaSincronizacion.hour.toString().padLeft(2, '0')}:${ultimaSincronizacion.minute.toString().padLeft(2, '0')}:${ultimaSincronizacion.second.toString().padLeft(2, '0')}-05:00" : null,
    "realizado": realizado == true ? 1 : 0,
    "tipoPredio": tipoPredio,
    "funcionarioId": funcionarioId,
    "funcionarioNombre": funcionarioNombre,
    "createdBy": createdBy,
    "createdDate": createdDate is DateTime ? "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}T${createdDate.hour.toString().padLeft(2, '0')}:${createdDate.minute.toString().padLeft(2, '0')}:${createdDate.second.toString().padLeft(2, '0')}-05:00" : null,
    "lastModifiedBy": lastModifiedBy,
    "lastModifiedDate": lastModifiedDate is DateTime ? "${lastModifiedDate.year.toString().padLeft(4, '0')}-${lastModifiedDate.month.toString().padLeft(2, '0')}-${lastModifiedDate.day.toString().padLeft(2, '0')}T${lastModifiedDate.hour.toString().padLeft(2, '0')}:${lastModifiedDate.minute.toString().padLeft(2, '0')}:${lastModifiedDate.second.toString().padLeft(2, '0')}-05:00" : null,
    "id": id,
    "cantidad": cantidad,
    "accion": accion,
    "propiedad": propiedad,
    "suspensionId": suspensionId,
    "materialRetiradoId": materialRetiradoId,
    "materialRetiradoNombre": materialRetiradoNombre,
    "transmittedToMovil": transmittedToMovil == true ? 1 : 0,
    "id": id,
    "idRemoto": idRemoto,
    "imagenesSync": imagenesSync == true ? 1 : 0,
    "guardadoLocal": guardadoLocal == true ? 1 : 0,
  };
  save() async{
    await initDatabase();
    ResponseDB r;
    if(this.id == 0 || this.id == null){
        this.id = null;
        r = await add('MaterialSuspensionIR', this);
    } else {
        r = await update('MaterialSuspensionIR', this);
    }
    return r;
  }
}
