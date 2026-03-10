lib/
├─ app/
│ ├─ router/ # Routing (misalnya menggunakan go_router)
│ │ └─ app_router.dart
│ └─ di/ # Inisialisasi dependency injection (GetIt atau
Provider)
│ └─ injection_container.dart
├─ src/
│ └─ features/
│ ├─ authentication/ # Contoh fitur: autentikasi
│ │ ├─ data/
│ │ │ ├─ datasources/ # API, database
│ │ │ ├─ models/ # Model data (e.g. DTO/Model)
│ │ │ └─ repositories/ # Implementasi repo
│ │ ├─ domain/
│ │ │ ├─ entities/ # Entitas core (kelas data immutable)
│ │ │ ├─ repositories/ # Interface repository
│ │ │ └─ usecases/ # Use case / interactor (bisnis logic)
│ │ └─ presentation/
│ │ ├─ providers/ # Riverpod Providers / StateNotifiers
│ │ ├─ pages/ # Layar / Screen (Widget)
│ │ └─ widgets/ # Widget UI spesifik fitur
│ └─ profile/ # Fitur lain (struktur serupa)
│ └─ …
├─ shared/ # Kode yang bisa dipakai lintas fitur
│ ├─ widgets/ # Widget umum (mis. tombol responsif, dll)
│ ├─ utils/ # Fungsi/utilitas bersama
│ └─ models/ # Model data bersama antar fitur (jika ada)
├─ constants/ # Konstanta aplikasi (colors, teks, URL API)
│ ├─ app_colors.dart
│ └─ api_endpoints.dart
├─ main.dart # Titik awal aplikasi (berbagai flavor jika
perlu)
└─ flavors/ # (Opsional) Konfigurasi flavor build (dev, prod,
dst.)
1
├─ dev/
│ └─ main_dev.dart
└─ prod/
└─ main_prod.dart


Pada contoh di atas, folder app/ (atau kadang disebut core/ ) berisi kode inisialisasi global seperti
routing dan setup DI . Misalnya, file app_router.dart (dengan go_router) mengatur rute
aplikasi, sedangkan injection_container.dart atau service_locator.dart (GetIt)
mendaftarkan dependensi aplikasi . Setiap fitur diletakkan di src/features/<nama_fitur>/
dengan struktur lapisan data, domain, dan presentation . Lapisan data berisi sumber data (API,
DB), model, dan implementasi repositori. Lapisan domain berisi entitas (data immutable), abstraksi
repositori, dan use case untuk logika bisnis. Lapisan presentation berisi UI dan state management
(misalnya Riverpod Providers di folder providers/ , halaman di pages/ , widget khusus fitur di
widgets/ ). Selain itu, shared/ menampung komponen atau utilitas yang dapat dipakai banyak
fitur (seperti widget platform-aware atau helpers) , dan constants/ menyimpan konstanta
aplikasi.
Mengapa: Alasan Pemilihan Struktur
Modularitas dan Scalability: Dengan memisahkan berdasarkan fitur dan lapisan, setiap tim
kecil dapat bekerja secara paralel tanpa saling mengganggu. Struktur feature-based ini
memudahkan penambahan fitur baru – kita cukup membuat folder fitur baru yang berisi data,
domain, dan presentation independen . Seperti dicatat Kelman Celis, pendekatan “src/
features” mempromosikan modularity sehingga “mudah menambahkan fitur tanpa
mengacaukan bagian lain” . Tim dapat fokus pada satu fitur saat mengembangkan, menguji,
atau merilis, sehingga aplikasi lebih mudah di-scale.
Maintainability: Clean Architecture memisahkan concerns secara tegas. Perubahan di UI atau
routing tidak akan memengaruhi logika bisnis (domain) maupun lapisan data secara langsung
. Misalnya, mengganti database atau menambah API baru hanya memerlukan
implementasi baru di data layer, sementara kode domain/use case tetap utuh. Ini juga membuat
pengujian unit dan integrasi lebih mudah – logika bisnis dapat diuji tanpa tergantung UI.
Sebagaimana ditekankan oleh para ahli, prinsip dependency inversion dalam arsitektur ini
membantu menjaga reduced coupling dan testability .
State Management (Riverpod) dan DI: Riverpod sebagai manajemen state tidak menentukan
struktur folder secara baku , sehingga perlu penataan sendiri. Dengan struktur di atas,
penyedia (providers) Riverpod diletakkan di lapisan presentasi (misal presentation/
providers/ ) atau di kelas domain, sesuai kebutuhan. Riverpod memudahkan injeksi
dependensi secara reaktif dan mendukung pengujian (dapat dengan mudah dimock) . Di sisi
lain, kita juga dapat menggunakan GetIt untuk dependency injection tradisional, dengan
membuat service locator di folder app/di . Misalnya injection_container.dart
menggunakan GetIt.instance untuk mendaftarkan repositori atau service. Pendekatan ini
menjaga agar objek-objek global (seperti service API) diinisialisasi sekali dan bisa diakses dari
mana saja.
Responsive (Mobile/Web): Struktur ini bersifat platform-agnostic, sehingga dapat
diimplementasikan baik pada aplikasi mobile maupun web. Untuk UI responsif, kita bisa
menambahkan widget khusus di dalam shared/widgets/ (mis. tombol
PlatformAwareButton ) atau memanfaatkan LayoutBuilder /breakpoint di halaman.
Bagian presentasi dirancang modular, sehingga kita bisa menyediakan tata letak berbeda
(mobile vs web) dalam widget yang sama atau terpisah berdasarkan lebar layar.
1
1 2
3 4
5
•
3 6
3
•
4 7
7
•
8
8
1 2
•
9
2
Bagaimana: Penggunaan dalam Pengembangan Sehari-hari
Dalam alur kerja harian, pengembang umumnya menambah atau mengubah kode dalam folder fitur
terkait:
- Menambah Fitur Baru: Biasanya dibuat folder baru di bawah src/features/ , misalnya src/
features/orders/ untuk fitur pemesanan. Dapat digunakan pendekatan template folder: siapkan
folder template/ berisi struktur standar (data/domain/presentation) lalu salin dan ganti namanya
sesuai fitur . Setelah itu, edit entitas, use case, repositori, dll. sesuai kebutuhan. Pendekatan ini
menghemat waktu boilerplate dan menjaga konsistensi struktur . - Integrasi State Management:
Di lapisan presentasi fitur, buat provider Riverpod (mis. StateNotifierProvider ) di folder
providers/ untuk mengelola state. Provider ini menggunakan use case dari lapisan domain. Contoh:
sebuah AuthNotifier ( StateNotifier ) memanggil LoginUseCase domain dan merespon
hasilnya, lalu UI di folder pages/ (LoginPage) watch provider tersebut untuk memperbarui tampilan. -
Pengaturan Routing: File router ( app/router/app_router.dart ) berisi daftar rute menggunakan
go_router. Setiap halaman baru di fitur didaftarkan di sini. Sebagai contoh, rute /login diarahkan ke
LoginPage dari features/authentication/presentation/pages/ . Dengan penempatan
terpusat, navigasi aplikasi dapat disesuaikan untuk mobile maupun web (menggunakan URL) tanpa
mengubah struktur folder fitur. - Dependency Injection: Saat aplikasi dijalankan, inisialisasi
dependensi dilakukan sekali di main.dart atau di app/di/injection_container.dart .
Misalnya, Anda dapat mendaftarkan instance API client,
GetIt.registerSingleton<ApiService>(...) , atau mendaftarkan repository dengan
GetIt.registerLazySingleton<OrderRepository>(() =>
OrderRepositoryImpl(apiService)) . Jika menggunakan Riverpod saja, Anda dapat
menginisialisasi ProviderScope di main.dart dan mendefinisikan provider global di folder serupa.
Intinya, semua konfigurasi DI global dilakukan di satu tempat untuk kemudahan pemeliharaan. -
Pengujian (Testing): Struktur terpisah memudahkan pengujian berlapis. Anda dapat menulis unit test
untuk use case (domain) dengan mock repository, serta unit/integrasi untuk provider/state tanpa
ketergantungan UI. Contoh: uji LoginUseCase dengan repository palsu, atau uji AuthNotifier
dengan repository yang di-inject (bisa menggunakan ProviderContainer pada Riverpod). Karena
business logic terisolasi dari Flutter, pengujian menjadi lebih sederhana dan cepat dijalankan. -
Responsive Development: Untuk aplikasi lintas platform, developer dapat merancang widget yang
responsif di folder widgets/ atau membuat logika adaptif di shared/widgets/ . Misalnya,
membuat widget layout khusus desktop vs mobile. Struktur folder ini tidak mengikat metode responsif
tertentu, namun mempermudah pengelompokan widget UI berdasarkan fitur atau kegunaan umum.
