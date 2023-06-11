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
    <title>PLN UIP Sumbagsel | Input Informasi Berita</title>
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
                            <a class="nav-link" href="/profil">Profil Kami</a>
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
        <table width="100%">
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
                            <hr />
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
                            @auth
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
                            @endauth
                        </div>
                    </td>

                    <td class="py-5" width="80%">
                        <div class="berita">
                            <div class="judul">
                                <p class="fw-bold">BERITA</p>
                            </div>
                            <div id="konten"><br>
                                <form action="{{ route('beranda.store') }}" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    <h5><strong>Tanggal Terbit</strong></h5>
                                    <input type="date" name="tanggal_berita" id="tanggal_berita" required>
                                    <h5><strong>Judul Kegiatan</strong></h5>
                                    <input type="text" name="judul_berita" required>
                                    <h5><strong>Isi Berita Kegiatan</strong></h5>
                                    <textarea rows="10" cols="100" class="span12" name="isi_berita" id="editor"></textarea>
                                    <h5><strong>Dokumentasi</strong></h5>
                                    <input type="file" name="foto[]" multiple><br>
                                    <button type="reset" class="btn btn-transparent">Kembali</button>
                                    <button type="submit" class="btn btn-info">Kirim</button>
                                </form>                                
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

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
                <li><img src={{ asset('css/location.png') }} alt="maps" width="24px">Jl. Residen Abdul Rozak
                    No.2180, 2 Ilir, Kec. Kalidoni, Kota Palembang, Sumatera Selatan 30163</li>
            </ul>
        </div>
    </footer>

    <script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
    </script>
    <script>
        function validateForm() {
            var editorData = editorInstance.getData();
            if (!editorData || editorData.trim() === '') {
                alert('Isi Berita Kegiatan harus diisi.');
                return false;
            }
            return true;
        }

        ClassicEditor
            .create(document.querySelector('#editor'))
            .then(editor => {
                editorInstance = editor;
            })
            .catch(error => {
                console.error(error);
            });
    </script>
</body>

</html>
