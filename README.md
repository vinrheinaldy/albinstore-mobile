# Albinstore
something something put here something something, something something change name later something something

<details>
  <summary> <b> Tugas 7: Elemen Dasar Flutter </b></summary>

  ## Pertanyaan 1
**Step-by-step checklist tugas 7**

1. Untuk memulai sebuah project flutter, kita harus membuat repositori lokal terlebih dahulu bernama `albinstore-mobile` lalu menjalankan `flutter create albinstore-mobile` lalu pindahlah direktori kesitu
2. Dalam direktori `lib` dalam `albinstore-mobile` saya membuat file bernama `menu.dart` dan memindahkan sebagian kode dari `main.dart`
3. Kemudian kita membuat tombol sederhana, ini dapat dilakukan dengan membuat class baru bernama `ItemHomepage` yang menyimpan properti tombol
   ```
   class ItemHomepage {
    final String name;
    final IconData icon;
    final Color color;

    ItemHomepage(this.name, this.icon, this.color);
    }
   ```
4. Setelah itu kita membuat `ItemCard` untuk menampilkan tombol yang berisi
```

class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
5. Ketiga tombol diatas dapat disimpan di list `items` dengan parameter color agar dapat memiliki warna yang berbeda-beda
```
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.list,
        const Color.fromARGB(255, 135, 2, 175)),
    ItemHomepage("Tambah Produk", Icons.add, Colors.purple),
    ItemHomepage(
        "Logout", Icons.logout, const Color.fromARGB(255, 194, 57, 212)),
```
6. Untuk memunculkan Snackbar `Tombol telah ditekan` kita dapat menggunakan ScaffoldMessenger pada `ItemCard` yang berisi
```
onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
```

## Pertanyaan 2
**Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya:**

**Stateless Widget**: Widget yang tidak memiliki state (data yang bisa berubah). Tampilan dan data di dalamnya tetap sama sepanjang waktu. Contoh: teks atau ikon statis. Menggunakan StatelessWidget.

**Stateful Widget**: Widget yang memiliki state dan bisa berubah selama aplikasi berjalan. Cocok untuk elemen yang perlu memperbarui UI berdasarkan interaksi atau data dinamis. Contoh: tombol yang bisa diubah warnanya saat ditekan, atau form yang menerima input. Menggunakan StatefulWidget.

## Pertanyaan 3

**Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.:**

Scaffold: Struktur dasar halaman, menyediakan kerangka untuk AppBar dan body.
AppBar: Menampilkan judul di bagian atas aplikasi.
Padding: Memberikan jarak di sekitar widget.
Column: Menyusun widget secara vertikal.
Row: Menyusun widget secara horizontal.
Text: Menampilkan teks statis.
Card: Menampilkan informasi dalam bentuk kartu (digunakan di InfoCard).
Container: Membungkus widget lain dan bisa diatur ukuran, padding, dan warnanya.
GridView: Menampilkan ItemCard dalam bentuk grid (tiga kolom).
InkWell: Membuat widget responsif terhadap sentuhan, memicu SnackBar saat ditekan.
SnackBar: Menampilkan pesan sementara di bagian bawah layar.
Icon: Menampilkan ikon sesuai item.icon.

## Pertanyaan 4

**Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut:**

`setState()` merupakan fungsi dalam Stateful Widget yang digunakan untuk memberitahu Flutter bahwa ada perubahan pada state widget, sehingga widget perlu di-render ulang dengan data terbaru. Fungsinya mengupdate tampilan UI setiap kali ada perubahan pada variabel yang berada dalam State. Untuk variabel yang terdampak, hanya variabel dalam class State yang akan ter-update dan memengaruhi tampilan UI saat setState() dipanggil. Biasanya variabel ini adalah data yang bisa berubah, seperti teks, warna, posisi, atau kondisi logika dalam widget.

## Pertanyaan 5

**Jelaskan perbedaan antara `const` dengan `final`:**

`const`: Nilai ditentukan saat kompilasi dan tidak bisa berubah selamanya. Contoh: `const umur = 18;`

`final`: Nilai ditentukan saat runtime dan tidak bisa diubah setelah pertama kali diinisialisasi. Contoh: `final waktu = new DateTime.now();`

</details>

<details> 
  <summary><b> Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements</b></summary>

### 1.  Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
`const` digunakan untuk membuat objek yang bersifat immutable (tidak dapat diubah) dan compile-time constant (konstan pada waktu kompilasi).

### 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
`Column` digunakan untuk menyusun widget secara vertikal. Sedangkan `Row` digunakan untuk menyusun widget secara horizontal.

Contoh Pengimplementasian `Coloumn` adalah seperti
```
Column(
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```

Sedangkan Contoh Pengimplementasian `row` adalah seperti
```
Row(
  children: [
    Icon(Icons.star),
    Text('Star'),
  ],
)
```

### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Elemen yang digunakan salah satunya adalah `TextFormField`, ya ada banyak elemen input flutter yang tidak digunakan seperti `Dropdown Button`.

### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Menggunakan `ThemeData` dan `MaterialApp` dan ya di implementasikan pada `main.dart` yang berisi
```
return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(
          primary: const Color(0xFF4C51BF),
          secondary: const Color(0xFF4C51BF),
        ),
      ),
      home: MyHomePage(),
    );
```
### 5.  Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Biasanya menggunakan `Navigator`

</details>
