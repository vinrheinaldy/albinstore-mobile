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

<details>
  <summary>Tugas 9 Integrasi Layanan Web Django dengan Aplikasi Flutter</summary>

  ### Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
  Model memberikan struktur yang jelas untuk data JSON. Ketika JSON diubah menjadi sebuah objek Dart, kita bisa langsung menggunakan properti dan metode objek tersebut tanpa harus mengakses data mentah (misalnya menggunakan string key seperti json['nama']). Ini membuat kode lebih mudah dibaca, dikelola, dan bebas dari typo. Untuk error pada umumnya tidak namun bisa saja ada error seperti typo, tipe data yang aneh, dll

  ### Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
  Mempermudah pengiriman permintaan HTTP, seperti GET, POST, PUT, DELETE, dan lainnya.

  ### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
  CookieRequest biasanya digunakan dalam aplikasi web untuk mengelola session cookies saat berkomunikasi dengan server. Dalam Flutter, CookieRequest pada umumnya sering digunakan untuk: autentikasi, automasi cookies, dll

  ### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
  1. Input Data dari User Data biasanya diambil melalui widget input(text field, dll)
  2. Setelah input diterima, data biasanya disimpan atau diolah menggunakan state management. Flutter menyediakan beberapa pendekatan untuk ini(stateful widget)
  3. Setelah data diterima, langkah berikutnya adalah memprosesnya(validasi)
  4. Data yang telah diproses atau diterima dari backend akan di-render kembali ke layar. Widget seperti Text, ListView, atau GridView sering digunakan.
  5. Render ke Layar Setelah data diproses, Flutter akan merender ulang UI menggunakan widget tree.

  ### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
  1. Register
- Flutter Side:
    - User mengisi form registrasi (seperti username dan password) di aplikasi Flutter.
    - Data dikirim ke backend Django menggunakan request HTTP (POST) ke endpoint /register.

- Django Side:
    - Endpoint /register di-backend menerima data.
    - Backend memvalidasi data: apakah password cocok dan apakah username sudah ada.
    - Jika validasi sukses, akun baru dibuat menggunakan User.objects.create_user

2. Login
- Flutter Side:
    - User memasukkan username dan password.
    - Flutter mengirim data ke backend melalui POST request ke endpoint /login.

- Django Side:
    - Endpoint /login menerima data username dan password.
    - Fungsi authenticate memeriksa kredensial di database.
    - Jika sukses, Django memanggil auth_login untuk membuat sesi pengguna.

3. Logout
- Flutter Side:
    - User menekan tombol logout.
    - Flutter mengirimkan request ke endpoint /logout.

- Django Side:
    - Endpoint /logout memanggil auth_logout untuk menghapus sesi pengguna.

4. Menampilkan Menu Setelah Autentikasi
- Flutter Side:
    - Setelah login berhasil, Flutter menyimpan informasi pengguna (misalnya, token sesi atau data username).
    - Halaman menu ditampilkan menggunakan Navigator.
### Implementasi
1. Buat file register.dart dalam directory `register.dart`dan `login.dart`.
2. Membuat modul baru di proyek django untuk autentikasi.
3. Buat function untuk menghandle registrasi dan login.
4. Lakukan routing di urls.py.
5. Tambahkan modul autentikasi di settings.py proyek utama django.
6. Untuk membuat model, kita menggunakan data json dari web dan mengambil model yang terbuat dari web QuickType
7. Buat directory baru bernama model dan buat file dart baru untuk models flutternya.
8. Buat file dart baru di directory screens untuk menampilkan data yang dimasukkan.
9. Buat file dart baru lagi di directroy screens untuk menampilkan detail masing-masing data.
</details>
