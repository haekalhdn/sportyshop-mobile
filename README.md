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

Konsistensinya dicapai dengan mendefinisikan skema warna di dalam `MaterialApp`. Di file `main.dart`, saya mengatur `ThemeData` agar menggunakan `primarySwatch: Colors.blue`.
Ini artinya:
1.  Semua widget yang secara *default* menggunakan warna utama aplikasi (seperti `AppBar`) akan otomatis berwarna biru tanpa perlu diatur manual di setiap halaman.
2.  Warna turunan (seperti `secondary`) juga diatur, yang digunakan oleh widget lain seperti `FloatingActionButton` atau, dalam kasus saya, saya gunakan untuk `ShopCard` (tombol) di tutorial sebelumnya.
Dengan mengatur `colorScheme` di satu tempat (`main.dart`), saya memastikan bahwa `AppBar` di `Halaman Utama` dan `AppBar` di `Halaman Form` (meskipun saya timpa manual warnanya) memiliki palet dasar yang sama, sehingga menciptakan identitas *brand* "SportyShop" yang konsisten untuk developing yang baik kedepannya.


# Tugas 9

## 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan `Map<String, dynamic>` tanpa model (terkait validasi tipe, null-safety, maintainability)?

Kita perlu membuat model Dart seperti `class Product` karena Dart adalah bahasa yang *Strongly Typed*, sehingga struktur data yang jelas sangat diperlukan untuk menjamin keamanan dan kestabilan aplikasi. Jika kita langsung memetakan `Map<String, dynamic>` tanpa model, kita akan kehilangan fitur validasi tipe otomatis, yang berisiko menyebabkan kesalahan fatal seperti memasukkan data *string* ke variabel *integer* yang baru akan terdeteksi saat aplikasi berjalan (*runtime error*). Selain itu, tanpa model, penerapan *null-safety* menjadi sulit karena kita tidak mendefinisikan secara tegas atribut mana yang boleh kosong dan mana yang wajib ada, memaksa kita melakukan pengecekan manual yang rawan bug. Dari sisi *maintainability*, penggunaan model jauh lebih efisien karena memungkinkan fitur *autocomplete* pada IDE bekerja, sehingga mencegah kesalahan penulisan nama atribut (*typo*) yang sering terjadi jika kita harus mengetik *key string* secara manual setiap saat.

## 2. Apa fungsi package `http` dan `CookieRequest` dalam tugas ini? Jelaskan perbedaan peran `http` vs `CookieRequest`.

Dalam tugas ini, package `http` berfungsi sebagai pustaka dasar yang menyediakan metode standar untuk melakukan pertukaran data melalui protokol HTTP, seperti melakukan *request* GET atau POST ke server. Namun, `http` bersifat *stateless*, yang berarti ia tidak memiliki kemampuan bawaan untuk menyimpan informasi sesi pengguna antar permintaan. Sebaliknya, `CookieRequest` (dari package `pbp_django_auth`) adalah lapisan tambahan atau *wrapper* di atas `http` yang dirancang khusus untuk menangani autentikasi dengan framework seperti Django. Perbedaan utamanya terletak pada manajemen sesi; `CookieRequest` secara otomatis menangkap, menyimpan, dan menyertakan kembali *cookies* (seperti `sessionid` dan `csrftoken`) pada setiap permintaan berikutnya. Hal ini sangat penting dalam aplikasi yang membutuhkan login, karena tanpa `CookieRequest`, server akan menganggap setiap permintaan berasal dari pengguna anonim baru, sehingga fitur yang memerlukan otorisasi tidak akan berfungsi.

## 3. Jelaskan mengapa instance `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance `CookieRequest` perlu dibagikan ke seluruh komponen aplikasi, biasanya menggunakan `Provider`, karena data sesi login dan *cookies* disimpan secara lokal di dalam memori objek tersebut. Jika kita membuat objek `CookieRequest` baru di setiap halaman atau widget (misalnya membuat baru di halaman login, lalu membuat baru lagi di halaman daftar produk), maka *cookies* yang berhasil didapatkan saat login tidak akan terbawa ke halaman berikutnya. Akibatnya, server akan gagal mengenali pengguna tersebut dan menganggapnya belum login. Dengan menerapkan pola *Singleton* atau membagikan satu instance yang sama ke seluruh pohon widget aplikasi, kita memastikan konsistensi sesi pengguna, sehingga status login tetap terjaga meskipun pengguna berpindah-pindah halaman dalam aplikasi.

## 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Konfigurasi konektivitas sangat krusial agar emulator Android dapat berkomunikasi dengan server Django lokal. Penambahan `10.0.2.2` pada `ALLOWED_HOSTS` diperlukan karena bagi emulator Android, `localhost` merujuk pada dirinya sendiri, sedangkan `10.0.2.2` adalah IP alias khusus untuk mengakses `localhost` komputer host tempat Django berjalan. Pengaktifan CORS (*Cross-Origin Resource Sharing*) di Django diperlukan agar browser atau klien lain yang dianggap berbeda domain diizinkan untuk mengakses sumber daya server. Pengaturan `SameSite` dan `CSRF` pada cookie juga harus disesuaikan agar sesi dapat disimpan dengan benar oleh klien non-browser atau saat pengembangan. Terakhir, izin akses internet pada `AndroidManifest.xml` wajib ditambahkan agar sistem operasi Android mengizinkan aplikasi membuka koneksi jaringan. Jika konfigurasi ini tidak dilakukan dengan benar, aplikasi akan mengalami kegagalan koneksi seperti `Connection Refused`, data tidak dapat dimuat, atau proses login akan selalu gagal karena cookies ditolak baik oleh klien maupun server.

## 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Mekanisme ini dimulai ketika pengguna memasukkan data pada formulir di Flutter, yang kemudian disimpan sementara dalam variabel state. Saat tombol simpan ditekan, data tersebut divalidasi dan dikonversi menjadi format string JSON menggunakan fungsi `jsonEncode`. Flutter kemudian mengirimkan data JSON ini melalui metode HTTP POST menggunakan `CookieRequest` ke *endpoint* URL yang sesuai di Django. Di sisi backend, Django menerima permintaan tersebut, mem-parsing JSON, membuat objek model baru, dan menyimpannya ke dalam database sebelum mengembalikan respons sukses. Setelah menerima konfirmasi sukses, Flutter akan mengarahkan pengguna kembali ke halaman daftar dan melakukan permintaan HTTP GET baru ke server. Data terbaru yang diterima dari server dalam format JSON kemudian diubah menjadi list objek model Dart menggunakan metode `fromJson`, dan akhirnya ditampilkan kembali ke antarmuka pengguna menggunakan widget seperti `GridView` atau `ListView`.

## 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Proses autentikasi dimulai dengan registrasi, di mana Flutter mengirimkan *username* dan *password* baru ke *endpoint* registrasi Django, yang kemudian memvalidasi dan membuat akun pengguna baru di database. Untuk login, pengguna memasukkan kredensial di Flutter yang kemudian dikirim ke *endpoint* login Django. Django memverifikasi kecocokan data tersebut, dan jika valid, server membuat sesi aktif dan mengirimkan *Session ID* melalui cookie dalam header respons. `CookieRequest` di Flutter menangkap cookie ini dan menyimpannya di memori lokal, menandakan bahwa pengguna telah terautentikasi, lalu mengarahkan pengguna ke halaman utama. Saat pengguna memilih logout, Flutter mengirimkan permintaan ke server dengan menyertakan cookie sesi tersebut. Django menerima permintaan, menghapus sesi aktif di server, dan Flutter kemudian menghapus cookie dari penyimpanan lokal, mengembalikan pengguna ke status tidak terautentikasi dan halaman login.

## 7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

1.  **Persiapan Backend (Django):**
    * Saya menginstal library `django-cors-headers` dan menambahkannya ke dalam `INSTALLED_APPS` serta urutan teratas `MIDDLEWARE` di `settings.py`.
    * Saya menambahkan konfigurasi variabel CORS, `CSRF_COOKIE`, dan menambahkan IP `10.0.2.2` ke dalam `ALLOWED_HOSTS`.
    * Saya membuat aplikasi `authentication` dan mendefinisikan views untuk `login`, `register`, dan `logout`.
    * Saya membuat view khusus `create_product_flutter` di `main/views.py` yang menerima input JSON untuk membuat produk baru.

2.  **Setup Model Flutter:**
    * Saya membuka endpoint JSON Django di browser, menyalin output JSON-nya, dan menggunakan Quicktype untuk men-generate kode model Dart.
    * Saya menyimpan kode tersebut ke dalam file `lib/models/product.dart` agar struktur data di Flutter sesuai dengan database SportyShop.

3.  **Halaman Autentikasi:**
    * Saya membuat `LoginPage` yang menggunakan fungsi `request.login` dari `pbp_django_auth` untuk masuk.
    * Saya membuat `RegisterPage` yang menggunakan `request.postJson` untuk mendaftar akun baru.

4.  **Fitur Utama (CRUD & Filter):**
    * **List Produk:** Saya membuat `ProductListPage` yang mengambil data menggunakan `request.get`. Saya menambahkan logika filter user: jika tombol "My Products" ditekan, endpoint request berubah menjadi `?filter=my`.
    * **Tambah Produk:** Saya memodifikasi `ProductFormPage` agar tombol "Save" mengirim data ke endpoint Django `/create-flutter/` menggunakan POST JSON.
    * **Detail Produk:** Saya membuat halaman `ProductDetailPage` untuk menampilkan seluruh atribut produk secara lengkap saat kartu produk diklik.

5.  **Styling & Navigasi:**
    * Saya mengubah tema aplikasi di `main.dart` menjadi **Dark Mode** dengan warna ungu agar identitas visualnya sesuai dengan website SportyShop.
    * Saya membuat widget `LeftDrawer` untuk mempermudah navigasi antar halaman Login, List, dan Form.