Tugas 7

**1. Jelaskan apa itu *widget tree* pada Flutter dan bagaimana hubungan *parent-child* (induk-anak) bekerja antar *widget*.**

Widget tree (pohon widget) adalah representasi hierarkis dari semua widget yang membentuk UI aplikasi Flutter, mirip silsilah keluarga. Ada satu widget "leluhur" (root), yang memiliki "anak", dan "anak" itu bisa memiliki "anak" lagi. Hubungan parent-child (induk-anak) adalah inti dari struktur ini. Parent (induk) adalah widget yang berisi widget lain (child/anak). Parent bertanggung jawab untuk mengontrol posisi, ukuran, dan batasan dari child-nya, sementara child "mewarisi" properti dari parent-nya.

**2. Sebutkan semua *widget* yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.**

Didalamnya saya  menggunakan MaterialApp sebagai widget yang mengatur tema dan navigasi. StatelessWidget adalah tipe dasar untuk widget statis seperti MyApp dan MyHomePage. Scaffold menyediakan kerangka halaman dengan AppBar (bilah judul atas) dan body (isi halaman). Untuk tampilan, saya menggunakan Text (menampilkan tulisan), Padding (memberi jarak), Column (menyusun widget secara vertikal), GridView (menyusun widget dalam grid), Center (membuat widget ke tengah), dan Icon (menampilkan ikon). Untuk fungsionalitasnya, saya memakai Material (memberi warna/bentuk), InkWell (membuat widget bisa ditekan dengan efek), dan Container (mengatur layout internal tombol).

**3. Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini sering digunakan sebagai widget root.**

Fungsi MaterialApp adalah sebagai widget pembungkus utama yang mengonfigurasi aplikasi untuk menggunakan Material Design. Ia menyediakan fungsionalitas inti seperti Theming (tema warna dan font global), Navigasi (mengelola perpindahan antar halaman), dan Lokalisasi (dukungan bahasa). MaterialApp digunakan sebagai widget root (akar) karena ia menyediakan semua "konteks" dan layanan fundamental yang diperlukan oleh widget Material Design lainnya di dalam aplikasi, seperti Scaffold atau AppBar.

**4. Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`. Kapan kamu memilih salah satunya?**

Perbedaan utamanya ada di state (data). StatelessWidget adalah widget "statis" atau immutable (tidak bisa berubah); tampilannya murni ditentukan oleh data yang diterima saat dibuat. Gunakan ini untuk UI yang tidak perlu berubah, seperti ikon, label teks, atau MyHomePage saya yang daftar tombolnya tetap. Sebaliknya, StatefulWidget adalah widget "dinamis" atau mutable (bisa berubah). Ia memiliki objek State internal yang bisa menyimpan data dan berubah selama runtime. Gunakan ini saat UI perlu merespons interaksi pengguna atau data eksternal, seperti checkbox, slider, atau halaman yang memuat data dari internet.

**5. Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di metode `build`?**

BuildContext adalah "alamat" atau "lokasi" dari sebuah widget di dalam widget tree. Ia penting karena memungkinkan widget untuk menemukan dan berinteraksi dengan widget "leluhur"-nya (misalnya untuk mengambil tema via Theme.of(context) atau menampilkan SnackBar via ScaffoldMessenger.of(context)). Flutter juga menggunakannya untuk efisiensi saat menentukan bagian mana dari tree yang perlu dibangun ulang. Dalam metode build(BuildContext context), context adalah parameter yang diterima dan digunakan untuk "menghubungkan" widget saat ini dengan sisa aplikasi.

**6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".**

Hot Reload adalah proses super cepat yang menyuntikkan kode baru ke dalam aplikasi yang sedang berjalan. Flutter akan membangun ulang widget tree, tetapi mempertahankan state (data) aplikasi. Ini sempurna untuk pengembangan UI (mengubah layout, warna) karena hasilnya instan tanpa mereset data. Hot Restart, di sisi lain, adalah proses yang lebih lambat yang memuat ulang kode aplikasi dan mereset state (data) aplikasi. Ini seperti menutup dan membuka kembali aplikasi. Hot Restart diperlukan untuk perubahan yang tidak bisa ditangani Hot Reload, seperti mengubah constructor global atau logika inisialisasi di main().


## Tugas 8

**1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?**

`Navigator.push()` "menumpuk" halaman baru di atas halaman saat ini. Halaman lama masih ada di memori, dan pengguna bisa kembali ke halaman tersebut dengan menekan tombol "Back". Ini cocok digunakan saat saya ingin pengguna bisa kembali, misalnya saat menekan tombol **"Tambah Produk"** dari halaman utama; setelah selesai menambah produk, pengguna bisa kembali ke halaman utama. `Navigator.pushReplacement()` "mengganti" halaman saat ini dengan halaman baru. Halaman lama dihancurkan dan dihapus dari tumpukan navigasi. Pengguna tidak bisa kembali ke halaman sebelumnya. Ini cocok digunakan untuk alur yang tidak boleh diulang, seperti setelah **Login** (saya ganti halaman Login dengan Halaman Utama) atau saat menggunakan **Drawer** untuk pindah menu. Saat di Drawer saya memilih **"Halaman Utama"**, saya menggunakan `pushReplacement` agar tumpukan navigasi tetap bersih dan tidak menumpuk halaman yang sama berulang kali.

**2. Bagaimana kamu memanfaatkan *hierarchy widget* seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?**

tampilan yang konsisten. `Scaffold` menyediakan kerangka dasar untuk setiap halaman. Dengan menggunakan `Scaffold` di setiap halaman (`Halaman Utama` dan `Halaman Form`), saya mendapatkan struktur yang seragam.
* `AppBar` (diletakkan di properti `appBar` milik `Scaffold`) agar halaman memiliki bilah judul atas yang seragam, di mana saya bisa konsisten menempatkan judul halaman.
* `Drawer` (diletakkan di properti `drawer` milik `Scaffold`) agar menu navigasi samping yang sama persis (`LeftDrawer`) dapat diakses dari halaman mana pun yang menggunakannya. Ini memberi pengguna cara yang familiar untuk berpindah antar halaman dari mana saja.
Dengan menggunakan tiga widget ini, saya tidak perlu membuat ulang bilah judul atau menu samping di setiap file, cukup panggil widget yang sudah ada.

**3. Dalam konteks desain antarmuka, apa kelebihan menggunakan *layout widget* seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.**

Kelebihan utamanya adalah untuk menciptakan UI yang rapi, responsif, dan fungsional.

* `Padding`: Memberi "ruang napas" antar elemen. Tanpa `Padding`, semua `TextFormField` di form akan saling menempel di tepi layar dan satu sama lain, membuatnya terlihat berantakan dan sulit dibaca. Di aplikasi saya, setiap `TextFormField` dibungkus `Padding(padding: const EdgeInsets.all(8.0), ...)` agar terlihat rapi.
* `SingleChildScrollView`: Ini sangat penting untuk form. Jika formnya panjang (seperti di aplikasi saya) dan dibuka di layar HP yang kecil, bagian bawah form (misalnya tombol "Save") akan terpotong dan tidak bisa diakses. `SingleChildScrollView` membungkus `Form` sehingga pengguna bisa *scroll* ke bawah untuk mengakses semua elemen form, mencegah *overflow error*.
* `ListView` (atau `Column` di dalam `SingleChildScrollView`): Digunakan untuk menyusun elemen-elemen form (seperti `TextFormField`, `Switch`, dan `Button`) secara vertikal, dari atas ke bawah, yang merupakan tata letak paling intuitif untuk mengisi formulir.

**4. Bagaimana kamu menyesuaikan *warna tema* agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?**

Konsistensi visual dicapai dengan mendefinisikan skema warna terpusat di dalam `MaterialApp`. Di file `main.dart`, saya mengatur `ThemeData` agar menggunakan `primarySwatch: Colors.blue`.
Ini artinya:
1.  Semua widget yang secara *default* menggunakan warna utama aplikasi (seperti `AppBar`) akan otomatis berwarna biru tanpa perlu diatur manual di setiap halaman.
2.  Warna turunan (seperti `secondary`) juga diatur, yang digunakan oleh widget lain seperti `FloatingActionButton` atau, dalam kasus saya, saya gunakan untuk `ShopCard` (tombol) di tutorial sebelumnya.
Dengan mengatur `colorScheme` di satu tempat (`main.dart`), saya memastikan bahwa `AppBar` di `Halaman Utama` dan `AppBar` di `Halaman Form` (meskipun saya timpa manual warnanya) memiliki palet dasar yang sama, sehingga menciptakan identitas *brand* "SportyShop" yang konsisten untuk developing yang baik kedepannya.
```eof