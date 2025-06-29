import 'package:flutter/material.dart';
import 'package:kitap_uyg/data/entity/kitaplar.dart';
import 'package:kitap_uyg/ui/views/detay_sayfa.dart';

class Anasayfa extends StatefulWidget {
  final List<Kitaplar> sepettekiKitap;

  const Anasayfa({
    Key? key,
    required this.sepettekiKitap,
  }) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var searchController = TextEditingController();
  List<Kitaplar> kitaplarListesi = [];
  List<Kitaplar> filteredKitaplar = [];
  List<Kitaplar> favoriKitaplar = [];
  List<Kitaplar> sepettekiKitaplar = [];
  List<Kategoriler> kategoriler = [];
  int _currentIndex = 0;


  final _formKey = GlobalKey<FormState>();
  TextEditingController _kullaniciAdiController = TextEditingController();
  TextEditingController _sifreController = TextEditingController();
  bool? _girisBasarili ;


  @override
  void initState() {
    super.initState();
    kitaplariYukle().then((kitaplar) {
      setState(() {
        kitaplarListesi = kitaplar;
        filteredKitaplar = kitaplar;
      });
    });



      kategorileriYukle();
    searchController.addListener(() {
      filtrele(searchController.text);
    });
  }

  Future<List<Kitaplar>> kitaplariYukle() async {
    var kitaplarListesi = <Kitaplar>[];
    var k1 = Kitaplar(id: 1, ad: "Suç ve Ceza", resim: "sucveceza.jpg", fiyat: 126,aciklama: "Roman genç bir öğrencinin işlediği cinayetin ardından yaşadığı psikolojik çöküşü ve vicdan azabını anlatır. Roman, suç, ceza, ahlaki sorumluluk ve insan doğasının derinliklerine dair derin felsefi soruları işler. Raskolnikov'un içsel çatışmaları, insanın özgürlüğü ve toplumla ilişkisini sorgulayan bu eser, edebiyat dünyasının en etkileyici yapıtlarından biridir.");
    var k2 = Kitaplar(id: 2, ad: "Anna Karenina", resim: "annakarenina.jpg", fiyat: 140,aciklama: "Anna Karenina, 19. yüzyıl Rusya'sında geçen bir aşk hikayesini anlatır. Roman, evli bir kadın olan Anna'nın, yakışıklı subay Vronski'ye duyduğu tutkulu aşkı ve bunun toplumda yarattığı yıkıcı sonuçları ele alır. Tolstoy, aşk, sadakat, toplum ve bireyin içsel çatışmaları üzerine derinlemesine bir inceleme sunar.");
    var k3 = Kitaplar(id: 3, ad: "Çalıkuşu", resim: "calikusu.jpg", fiyat: 150,aciklama: "Çalıkuşu, genç bir öğretmen olan Feride'nin hayatını anlatır. Feride, zor bir hayatın içinde, sevgi, aşk ve hayal kırıklıklarıyla mücadele ederken, Türk toplumunun geleneksel değerleriyle modernleşen dünyası arasında sıkışıp kalır. Roman, Feride'nin büyüme ve kendini keşfetme sürecini derinlemesine işler.");
    var k4 = Kitaplar(id: 4, ad: "Gurur ve Önyargı", resim: "gururveonyargı.jpg", fiyat: 166,aciklama: "Gurur ve Önyargı, 19. yüzyıl İngiltere'sinde, Elizabeth Bennet ile Mr. Darcy'nin arasındaki aşkı konu alır. Roman, sosyal sınıf, evlilik ve kişisel gurur gibi temalar etrafında şekillenirken, karakterlerin önyargılarını aşma yolculuklarını anlatır. Elizabeth ve Darcy'nin ilişkisi, zıtlıklar ve yanlış anlaşılmalarla başlasa da, sonunda karşılıklı saygı ve sevgiye dönüşür.");
    var k5 = Kitaplar(id: 5, ad: "Küçük Prens", resim: "kucukprens.jpg", fiyat: 100,aciklama: "Küçük Prens, Antoine de Saint-Exupéry'nin yazdığı, büyüklere hitap eden bir masaldır. Küçük bir prensin gezegenler arası yolculuğunda karşılaştığı karakterlerle, sevgi, dostluk, yalnızlık ve insan ilişkileri üzerine derin anlamlar keşfeder. Kitap, basit bir öyküyle önemli hayat dersleri verir ve her yaştan okura hitap eder.");
    var k6 = Kitaplar(id: 6, ad: "Yaşamak", resim: "yasamak.jpg", fiyat: 180,aciklama: "Bu roman, 20. yüzyılın Çin'inde geçen, bir adamın dramını ve hayatta kalma mücadelesini anlatır. Yaşamak, insanın hayatta karşılaştığı zorluklara, kayıplara ve var olma çabasına dair derin bir anlatım sunar.");
    var k7 = Kitaplar(id: 7, ad: "İçimizdeki Şeytan", resim: "icimizdekiseytan.jpg", fiyat: 145,aciklama: "İçimizdeki Şeytan, Sabahattin Ali'nin yazdığı, insanın içsel çatışmalarını ve toplumla olan ilişkisini derinlemesine ele alan bir romandır. Kitap, başkahraman öyküsü olan Osman'ın, aşkla, ideallerle ve ahlaki değerlerle mücadelesini anlatır. Sabahattin Ali, bireysel ruhsal çıkmazlar ve toplumsal baskıların birey üzerindeki etkilerini çarpıcı bir şekilde işler.");
    var k8 = Kitaplar(id: 8, ad: "Şeker Portakalı", resim: "sekerportakali.jpg", fiyat: 126,aciklama: "Şeker Portakalı, José Mauro de Vasconcelos'un yazdığı, çocukluk ve masumiyetin hikayesidir. Kitap, Brezilya'da yaşayan küçük Zezé'nin, yoksulluk, sevgi ve hayal kırıklıklarıyla dolu hayatını anlatır. Zezé'nin, şeker portakalı ağacına olan sevgisiyle içsel dünyası arasındaki bağ, okuyucuyu duygusal bir yolculuğa çıkarır.");
    kitaplarListesi.add(k1);
    kitaplarListesi.add(k2);
    kitaplarListesi.add(k3);
    kitaplarListesi.add(k4);
    kitaplarListesi.add(k5);
    kitaplarListesi.add(k6);
    kitaplarListesi.add(k7);
    kitaplarListesi.add(k8);
    return kitaplarListesi;
  }
  Future<void> kategorileriYukle() async {
    var kategorilerListesi = <Kategoriler>[];


    var kt1 = Kategoriler(kategori: "Romanlar");
    var kt2 = Kategoriler(kategori: "Klasikler");
    var kt3 = Kategoriler(kategori: "Çocuk Kitapları");
    var kt4 = Kategoriler(kategori: "Felsefe & Psikoloji");
    var kt5 = Kategoriler(kategori: "Aşk & Dram");


    kategorilerListesi.add(kt1);
    kategorilerListesi.add(kt2);
    kategorilerListesi.add(kt3);
    kategorilerListesi.add(kt4);
    kategorilerListesi.add(kt5);


    setState(() {
      kategoriler = kategorilerListesi;
    });
  }


  void filtrele(String aramaTerimi) {
    setState(() {
      filteredKitaplar = kitaplarListesi
          .where((kitap) => kitap.ad.toLowerCase().contains(aramaTerimi.toLowerCase()))
          .toList();
    });
  }


  void favoriyeEkle(Kitaplar kitap) {
    setState(() {
      if (!favoriKitaplar.contains(kitap)) {
        favoriKitaplar.add(kitap);
      } else {
        favoriKitaplar.remove(kitap);
      }
    });
  }


  void sepeteEkle(Kitaplar kitap) {
    setState(() {
      if (!sepettekiKitaplar.contains(kitap)) {
        sepettekiKitaplar.add(kitap);
      }

    });
  }

  bool _dogruGiris(String kullaniciAdi, String sifre) {
    return kullaniciAdi == "admin" && sifre == "1234"; // Basit kontrol
  }

  void _girisYap() {
    if (_formKey.currentState!.validate()) {
      if (_dogruGiris(_kullaniciAdiController.text, _sifreController.text)) {
        setState(() {
          _girisBasarili = true;
        });

        setState(() {
          _currentIndex = 0;
        });
      } else {
        setState(() {
          _girisBasarili = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kullanıcı adı veya şifre yanlış!')),
        );
      }
    }
  }



  List<Widget> _pages = [
    Center(child: Text("Anasayfa İçeriği")),
    Center(child: Text("Kategoriler İçeriği")),
    Center(child: Text("Favorilerim İçeriği")),
    Center(child: Text("Sepetim İçeriği")),
    Center(child: Text("Hesabım İçeriği")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kitaplar",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(188, 71, 73, 1),
      ),
      body: _currentIndex == 0
          ? Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Ara",
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: filteredKitaplar.isEmpty
                ? Center(child: Text("Eşleşen kitap bulunamadı."))
                : GridView.builder(
              itemCount: filteredKitaplar.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2.2,
              ),
              itemBuilder: (context, indeks) {
                var kitap = filteredKitaplar[indeks];
                bool isFavori = favoriKitaplar.contains(kitap);
                bool isSepet = sepettekiKitaplar.contains(kitap);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetaySayfa(kitap: kitap),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "resimler/${kitap.resim}",
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                            Text("${kitap.ad}", style: TextStyle(fontSize: 20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${kitap.fiyat} ₺",
                                  style: TextStyle(fontSize: 24),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    sepeteEkle(kitap);
                                    print("${kitap.ad} sepete eklendi");
                                  },
                                  child: Text("Sepet"),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          top: 1,
                          right: 8,
                          child: IconButton(
                            icon: Icon(
                              isFavori ? Icons.favorite : Icons.favorite_border_outlined,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              favoriyeEkle(kitap);
                              print("${kitap.ad} favorilere ${isFavori ? 'çıkartıldı' : 'eklendi'}");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
          : _currentIndex == 3
          ? ListView.builder(
        itemCount: sepettekiKitaplar.length,
        itemBuilder: (context, index) {
          var kitap = sepettekiKitaplar[index];
          return Padding(
            padding: const EdgeInsets.only(right: 15,left: 15,top: 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "resimler/${kitap.resim}",
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kitap.ad,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${kitap.fiyat} ₺",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                            sepettekiKitaplar.remove(kitap);
                          });
                        }, icon: Icon(Icons.restore_from_trash_outlined)),
                        //Text()
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      )
      : _currentIndex == 2 //
          ? ListView.builder(
        itemCount: favoriKitaplar.length,
        itemBuilder: (context, index) {
          var kitap = favoriKitaplar[index];
          return Padding(
            padding: const EdgeInsets.only(right: 15,left: 15,top: 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "resimler/${kitap.resim}",
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kitap.ad,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${kitap.fiyat} ₺",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                            favoriKitaplar.remove(kitap);
                          });
                        }, icon: Icon(Icons.favorite)),
                        //Text()
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      )
      : _currentIndex == 1
          ? ListView.builder(
        itemCount: kategoriler.length,
        itemBuilder: (context, index) {
          var kategori = kategoriler[index];
          return Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        kategori.kategori,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
          : _currentIndex == 4
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Giriş",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 10,),
              TextFormField(
                controller: _kullaniciAdiController,
                decoration: InputDecoration(labelText: 'Kullanıcı Adı',border: OutlineInputBorder(),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kullanıcı adı boş olamaz!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _sifreController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Şifre',border: OutlineInputBorder(),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Şifre boş olamaz!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _girisYap,
                child: Text("Giriş Yap"),
              ),
              if (_girisBasarili == false)
                Text(
                  "Hatalı giriş!",
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      )
          : SizedBox.shrink(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            if (index == 4) {
              _currentIndex = 4;
            } else {
              _currentIndex = index;
            }
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Anasayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Kategoriler",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorilerim",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Sepetim",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Hesabım",
          ),
        ],
      ),
    );
  }
}
