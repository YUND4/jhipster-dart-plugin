class ReconexionModelIR with ModsimORM implements ModsimModel { 
  DateTime fechaGenerado;
  @override
  ReconexionModelIR fromJSON(Map<String, dynamic> json) => ReconexionModelIR(
    fechaGenerado: json["fechaGenerado"],
  @override
  Map<String, dynamic> toJSON() => {
    "fechaGenerado": fechaGenerado is DateTime ? "${fechaGenerado.year.toString().padLeft(4, '0')}-${fechaGenerado.month.toString().padLeft(2, '0')}-${fechaGenerado.day.toString().padLeft(2, '0')}T${fechaGenerado.hour.toString().padLeft(2, '0')}:${fechaGenerado.minute.toString().padLeft(2, '0')}:${fechaGenerado.second.toString().padLeft(2, '0')}-05:00" : null,
  @override
  ReconexionModelIR fromSqlite(Map<String, dynamic> json) => ReconexionModelIR(
    fechaGenerado: json["fechaGenerado"]  is String ? DateTime.parse(json["fechaGenerado"]) : json["fechaGenerado"],
  @override
  Map<String, dynamic> toSqlite() => {
    "fechaGenerado": fechaGenerado is DateTime ? "${fechaGenerado.year.toString().padLeft(4, '0')}-${fechaGenerado.month.toString().padLeft(2, '0')}-${fechaGenerado.day.toString().padLeft(2, '0')}T${fechaGenerado.hour.toString().padLeft(2, '0')}:${fechaGenerado.minute.toString().padLeft(2, '0')}:${fechaGenerado.second.toString().padLeft(2, '0')}-05:00" : null,
  save() async{
    await initDatabase();
    ResponseDB r;
    if(this.id == 0 || this.id == null){
        this.id = null;
        r = await add('Reconexion', this);
    } else {
        r = await update('Reconexion', this);
    }
    return r;
  }
}