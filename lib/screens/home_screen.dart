import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: SafeArea(
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              InfoHomeWidget(),
              Spacer(),
              QuestionText(),
              EmergencyButton(),
              InfoButton(),
              Spacer()
            ],
          ),
          BottomModal()
        ]),
      ),
    );
  }
}

class BottomModal extends StatelessWidget {
  const BottomModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.1,
        minChildSize: 0.1,
        maxChildSize: 0.5,
        builder: (context, scrollController) {
          return Material(
            elevation: 30,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: ScrollButtomSheet(
              scrollController,
            ),
          );
        });
  }
}

class ScrollButtomSheet extends StatelessWidget {
  final ScrollController scrollController;

  const ScrollButtomSheet(this.scrollController);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: this.scrollController,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text('Instrucciones',
                style: GoogleFonts.roboto(
                    fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text(
              '1.- Permite a la app conocer tu ubicación',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '2.- Puedes registrar e iniciar sesión(opcional) o puedes usar la aplicación de manera anonima',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '3.- Al dar click en el boton de emergencia, tu ubicación y datos proporcionados seran enviados a las autoridades',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '4.- Recibirás apoyo de inmediato',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionText extends StatelessWidget {
  const QuestionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text('¿Estás en peligro?',
          style:
              GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text('Presiona una vez para emitir una alerta a las autoridades',
          style: GoogleFonts.poppins(fontSize: 20),
          textAlign: TextAlign.center),
    );
  }
}

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
            fixedSize: const Size(250, 250),
            shape: const CircleBorder()),
        onPressed: () {
          Navigator.pushNamed(context, 'map');
        },
        child: Text('Emergencia', style: GoogleFonts.poppins(fontSize: 40)));
  }
}

class InfoHomeWidget extends StatelessWidget {
  const InfoHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Icon(
            Icons.person_pin_circle_rounded,
            color: Colors.red,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          GeoLocalitation(),
          Spacer(),
          ImageProfile()
        ],
      ),
    );
  }
}

class GeoLocalitation extends StatelessWidget {
  const GeoLocalitation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Jojutla, Morelos',
        style: GoogleFonts.poppins(fontSize: 20, color: Colors.grey[700]));
  }
}

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1527565290982-018bcfdbee74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80'));
  }
}
