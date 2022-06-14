class Usuario {
  String uid = '';
  String nombre;
  String email;
  String telefono;
  String caracteristicas;
  String latitud;
  String longitud;
  bool online;

  Usuario({
    required this.uid,
    this.nombre = 'No proporcionado',
    this.email = 'No proporcionado',
    this.telefono = 'No proporcionado',
    this.caracteristicas = 'No proporcioinado',
    required this.latitud,
    required this.longitud,
    required this.online,
  });
}
