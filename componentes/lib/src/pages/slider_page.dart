import 'package:flutter/material.dart';

class Sliderpage extends StatefulWidget {

  @override
  _SliderpageState createState() => _SliderpageState();
}

class _SliderpageState extends State<Sliderpage> {
  double _valorSlider=100.0;
  bool _bloqueaCheck=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwicht(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        )
      ),
    );
  }

  Widget _crearSlider(){
    return  Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño de la imagen',
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloqueaCheck) ? null : (valor){
        setState(() {
          _valorSlider=valor;
        });
      },
    );
  }

  Widget _crearCheckbox(){
    // return Checkbox(
    //   value: _bloqueaCheck, 
    //   onChanged: (valor){
    //     setState(() {
    //       _bloqueaCheck=valor;
          
    //     });
    //   }
    // );
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloqueaCheck,
      onChanged: (valor){
        setState(() {
          _bloqueaCheck=valor;
        });
      }
    );
  }

  Widget _crearSwicht(){
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloqueaCheck,
      onChanged: (valor){
        setState(() {
          _bloqueaCheck=valor;
        });
      }
    );
  }

  Widget _crearImagen(){
    return Image(
      image: NetworkImage('url'),
      width: _valorSlider,
      fit: BoxFit.contain,
      );
  }
}