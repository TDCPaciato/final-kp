<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href={{ asset('https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css') }}
        rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
        crossorigin="anonymous">
    <link rel="stylesheet" href={{ asset('css/style.css') }}>
    <title>PLN UIP Sumbagsel | Profil</title>
</head>

<body>
    {{-- NAVBAR --}}
    <div>
        <nav class="navbar navbar-expand-lg" style="background-color: #B3CEFF">
            <div class="container-fluid">
                <a class="navbar-brand" href="/beranda">
                    <img src={{ asset('css/logo.png') }} alt="Logo" width="30" height="30"
                        class="d-inline-block align-text-top">
                    PLN UIP Sumbagsel
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="/beranda">Beranda</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/profil">Profil Kami</a>
                        </li>
                        @auth
                        <li class="nav-item">
                            <a class="nav-link" href="https://lookerstudio.google.com/reporting/b19898ed-4c28-4d14-b996-f413540e300f">Dashboard Kinerja</a>
                        </li>
                        @endauth
                        <li class="nav-item">
                            @auth
                                <!-- Tautan Logout -->
                                <form method="POST" action="{{ route('logout') }}">
                                    @csrf
                                    <x-dropdown-link class="nav-link" :href="route('logout')"
                                        onclick="event.preventDefault(); this.closest('form').submit();">
                                        Keluar
                                    </x-dropdown-link>
                                </form>
                            @else
                                <!-- Tautan Login -->
                                {{-- <x-nav-link class="nav-link" :href="route('login')" :active="request()->routeIs('login')">
                                    Login
                                </x-nav-link> --}}

                                <a class="nav-link{{ request()->routeIs('login') ? ' active' : '' }}"
                                    href="{{ route('login') }}">Masuk</a>
                            @endauth

                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    {{-- ATRIBUT --}}
    <div>
        <table>
            <tbody>
                <tr valign="top">
                    <td class="py-5" width="20%">
                        <div class="atribut">
                            <h4 class="fw-bold">Selamat Datang</h4>
                            @auth
                            <p class="text-center fw-bold">
                                {{ auth()->user()->name }}
                                <br>
                                {{ auth()->user()->email }}
                            </p>
                            @endauth
                            <hr/>
                            <div class="judul">
                                <p class="fw-bold">ATRIBUT</p>
                            </div>
                            <ul>
                                <li>
                                    <a href="http://erpappw1.pusat.corp.pln.co.id/irj/portal">SAP Logon</a>
                                </li>
                                <li>
                                    <a href="https://portal.pln.co.id/">Portal PLN</a>
                                </li>
                                <li>
                                    <a href="https://mail.google.com/">Gmail</a>
                                </li>
                            </ul><br>
                            @can('view_informasi', auth()->user())
                            <div class="judul">
                                <p class="fw-bold">UPDATE INFORMASI</p>
                            </div>
                            <ul>
                                <li>
                                    <a href="/input_pengumuman">Pengumuman</a>
                                </li>
                                <li>
                                    <a href="/beranda/create">Berita</a>
                                </li>
                                <li>
                                    <a href="{{ route('register') }}">Tambah Akun</a>
                                </li>
                            </ul>
                            @endcan
                        </div>
                    </td>
                    <td class="py-5" width="80%">
                        <div class="berita">
                            <div class="judul">
                                <h6 class="fw-bold">PROFIL PERUSAHAAN</h6>
                            </div>
                            <div id="konten"><br>
                                <div id="judul">
                                    <h5><strong>PROFIL SINGKAT</strong></h5>
                                </div>
                                <p style="text-align: justify">
                                    Perusahaan Listrik Negara (PLN) atau nama resminya adalah PT. PLN (PERSERO) adalah
                                    sebuah Badan Usaha Milik Negara (BUMN) yang mengurusi semua aspek kelistrikan yang
                                    ada di Indonesia. Berawal di akhir abad ke 19, perkembangan ketenagalistrikan di
                                    Indonesia mulai ditingkatkan saat beberapa perusahaan asal Belanda yang bergerak di
                                    bidang pabrik gula dan pabrik teh mendirikan pembangkit listrik untuk keperluan
                                    sendiri antara tahun 1942–1945 terjadi, 50 Peralihan pengelolaan
                                    perusahaan-perusahaan Belanda tersebut oleh Jepang, setelah Belanda menyerah kepada
                                    pasukan tentara Jepang di awal Perang Dunia II.
                                    <br>
                                    <br>
                                    Proses peralihan kekuasaan kembali terjadi di akhir Perang Dunia II pada Agustus
                                    1945, saat Jepang menyerah kepada Sekutu. Kesempatan ini dimanfaatkan oleh para
                                    pemuda dan buruh listrik melalui delegasi Buruh/Pegawai Listrik dan Gas yang
                                    bersama-sama dengan Pemimpin KNI Pusat berinisiatif menghadap Presiden Soekarno
                                    untuk menyerahkan perusahaan-perusahaan tersebut kepada Pemerintah Republik
                                    Indonesia. Pada 27 Oktober 1945, Presiden Soekarno membentuk Jawatan Listrik dan Gas
                                    di bawah Departemen Pekerjaan Umum dan Tenaga dengan kapasitas pembangkit tenaga
                                    listrik sebesar 157,5 MW.
                                    <br>
                                    <br>
                                    Pada tanggal 1 januari 1961, Jawatan Listrik dan Gas diubah menjadi BPU-PLN (Badan
                                    Pemimpin Umum Perusahaan Listrik Negara) yang bergerak di bidang listrik, gas, dan
                                    kokas yang dibubarkan pada tanggal 1 Januari 1965. Pada saat yang sama, 2 (dua)
                                    perusahaan negara yaitu Perusahaan Listrik Negara (PLN) sebagai pengelola tenaga
                                    listrik milik negara dan Perusahaan Gas Negara (PGN) sebagai pengelola gas
                                    diresmikan.
                                    <br>
                                    <br>
                                    Pada tahun 1972, sesuai dengan Peraturan Pemerintah No. 18, status Perusahaan
                                    Listrik Negara (PLN) ditetapkan sebagai Perusahaan Umum Listrik Negara dan sebagai
                                    Pemegang Kuasa Usaha Ketenagalistrikan (PKUK) dengan tugas menyediakan tenaga
                                    listrik bagi kepentingan umum.
                                    <br>
                                    <br>
                                    Seiring dengan kebijakan Pemerintah yang memberikan kesempatan kepada sektor swasta
                                    untuk bergerak dalam bisnis penyediaan listrik, maka sejak tahun 1994 status PLN
                                    beralih dari Perusahaan Umum menjadi Perusahaan Perseroan (Persero) dan juga sebagai
                                    PKUK dalam menyediakan listrik bagi kepentingan umum hingga sekarang.
                                </p>
                            </div>
                            <div id="konten">
                                <div id="judul">
                                    <h5><strong>VISI</strong></h5>
                                </div>
                                <p style="text-align: justify">
                                    Menjadi Perusahaan Listrik Terkemuka se-Asia Tenggara dan #1 Pilihan Pelanggan untuk
                                    Solusi Energi.
                                </p>
                            </div>
                            <div id="konten">
                                <div id="judul">
                                    <h5><strong>MISI</strong></h5>
                                </div>
                                <ul>
                                    <li>
                                        Menjalankan bisnis kelistrikan dan bidang lain yang terkait, berorientasi pada
                                        kepuasan pelanggan, anggota perusahaan dan pemegang saham.
                                    </li>
                                    <li>
                                        Menjadikan tenaga listrik sebagai media untuk meningkatkan kualitas kehidupan
                                        masyarakat.
                                    </li>
                                    <li>
                                        Mengupayakan agar tenaga listrik menjadi pendorong kegiatan ekonomi.
                                    </li>
                                    <li>
                                        Menjalankan kegiatan usaha yang berwawasan lingkungan.
                                    </li>
                                </ul>
                            </div>
                            <div id="konten">
                                <div id="judul">
                                    <h5><strong>STRUKTUR ORGANISASI</strong></h5>
                                </div>
                                <div class="foto">
                                    <center>
                                        <img src="css/bagan.png" alt="Struktur Organisasi">
                                    </center>
                                </div>
                            </div>
                            <div id="konten">
                                <div id="judul">
                                    <h5><strong>FOTO KANTOR</strong></h5>
                                </div>
                                <div class="foto">
                                    <center>
                                        <img src="css/kantor.jpg" alt="Struktur Organisasi" width="636px">
                                    </center>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
<footer>
    <div class="kontak">
        <h4>KONTAK</h4>
        <ul class="list-unstyled column-2">
            <li><img src={{ asset('css/whatsapp.png') }} alt="whatsapp" width="24px">0812-3456-78910</li>
            <li><img src={{ asset('css/google.png') }} alt="gmail" width="24px">uip-sumbagsel@pln.co.id</li>
        </ul>
    </div>
    <div class="alamat">
        <h4>ALAMAT</h4>
        <ul class="list-unstyled column-2">
            <li><img src={{ asset('css/location.png') }} alt="maps" width="24px">Jl. Residen Abdul Rozak No.2180,
                2 Ilir, Kec. Kalidoni, Kota Palembang, Sumatera Selatan 30163</li>
        </ul>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
</script>

</html>
