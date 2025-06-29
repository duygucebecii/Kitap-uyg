import 'package:flutter/material.dart';
import 'package:kitap_uyg/data/entity/kitaplar.dart';
import 'package:kitap_uyg/ui/views/anasayfa.dart'; // Anasayfa'ya import

class DetaySayfa extends StatefulWidget {
  Kitaplar kitap;
  DetaySayfa({required this.kitap});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  int adet = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kitap Detayı", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(188, 71, 73, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.kitap.resim}", height: 300, fit: BoxFit.cover),
            Text("${widget.kitap.ad}", style: TextStyle(fontSize: 30)),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Text("${widget.kitap.aciklama}", style: TextStyle(fontSize: 15)),
            ),
            Text("${widget.kitap.fiyat} ₺", style: TextStyle(fontSize: 30)),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),

            )
          ],
        ),
      ),
    );
  }
}
