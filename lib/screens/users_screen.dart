import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:webadminayuntamiento/models/usuarioTemp.dart';
import 'package:webadminayuntamiento/services/auth_service.dart';
import 'package:webadminayuntamiento/services/socket_service.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(
        uid: '1',
        nombre: 'Maria Juana Osorio',
        email: 'prueba1@ejemplo.com',
        online: true,
        caracteristicas: '',
        telefono: '1233211231',
        latitud: '18.612993636220082',
        longitud: ' -99.17436631519939'),
    Usuario(
        uid: '2',
        nombre: 'Marisol Saldaña',
        email: 'prueba2@ejemplo.com',
        online: true,
        caracteristicas: '',
        telefono: '2344322342',
        latitud: '18.622410980393386',
        longitud: '-99.19818162752325'),
    Usuario(
        uid: '3',
        nombre: 'Ana Isabel Santos',
        email: 'prueba3@ejemplo.com',
        online: true,
        caracteristicas: '',
        telefono: '345543345543',
        latitud: '18.614425570708494',
        longitud: '-99.17815314336468'),
    Usuario(
        uid: '4',
        nombre: 'No proporcionado',
        email: 'No proporcionado',
        online: true,
        caracteristicas: 'No proporcionado',
        telefono: 'No proporcionado',
        latitud: '18.618846276852278',
        longitud: '-99.18198473457981'),
    Usuario(
        uid: '5',
        nombre: 'Tatiana Mora',
        email: 'prueba5@ejemplo.com',
        online: true,
        caracteristicas: '',
        telefono: '',
        latitud: '18.618149771494817',
        longitud: '99.17484578520761'),
    Usuario(
        uid: '6',
        nombre: 'Jesica Campos',
        email: 'prueba6@ejemplo.com',
        online: true,
        caracteristicas: '',
        telefono: '',
        latitud: '18.61253940600806',
        longitud: '-99.18148036511776'),
    Usuario(
        uid: '7',
        nombre: 'No proporcionado',
        email: 'No proporcionado',
        online: false,
        caracteristicas: 'No proporcionado',
        telefono: 'No proporcionado',
        latitud: '18.600826319950084',
        longitud: '-99.186592219547'),
    Usuario(
        uid: '8',
        nombre: 'Paloma Carranza',
        email: 'prueba8@ejemplo.com',
        online: false,
        caracteristicas: '',
        telefono: '',
        latitud: '18.62092423820678',
        longitud: ' -99.17988093672139'),
  ];

  _cargarUsuarios() {
    void _onRegres() async {
      // monitor network fetch
      await Future.delayed(Duration(milliseconds: 1000));
      // if failed,use refreshFailed()
      _refreshController.refreshCompleted();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text(
              usuario?.nombre ?? 'Sin Nombre',
              style: TextStyle(color: Colors.black87),
            ),
            elevation: 1,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                  AuthService.deleteToken();
                  socketService.disconnect();
                },
                icon: Icon(Icons.exit_to_app)),
            actions: [
              Container(
                margin: EdgeInsets.only(
                  right: 10,
                ),
                child: (socketService.serverStatus == ServerStatus.Online)
                    ? Icon(Icons.check_circle, color: Colors.green[400])
                    : Icon(Icons.check_circle, color: Colors.red),
              )
            ]),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _cargarUsuarios(),
          header: WaterDropHeader(),
          child: _listViewUsuarios(usuarios: usuarios),
        ));
  }
}

class _listViewUsuarios extends StatelessWidget {
  const _listViewUsuarios({
    Key? key,
    required this.usuarios,
  }) : super(key: key);

  final List<Usuario> usuarios;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (_, i) => _usuariosListTile(usuarios: usuarios[i]),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length);
  }
}

class _usuariosListTile extends StatelessWidget {
  const _usuariosListTile({
    Key? key,
    required this.usuarios,
  }) : super(key: key);

  final Usuario usuarios;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(usuarios.nombre),
      subtitle: Text(usuarios.telefono),
      leading: CircleAvatar(
        child: Text(usuarios.nombre.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: usuarios.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
