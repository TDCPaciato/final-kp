<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="{{ asset('https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css') }}"
        rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
        crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>PLN UIP Sumbagsel | Beranda</title>
</head>

<body>
    {{-- NAVBAR --}}
    <div>
        <nav class="navbar navbar-expand-lg" style="background-color: #B3CEFF">
            <div class="container-fluid">
                <a class="navbar-brand" href="/beranda">
                    <img src="{{ asset('css/logo.png') }}" alt="Logo" width="30" height="30"
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
                                <a class="nav-link"
                                    href="https://lookerstudio.google.com/reporting/b19898ed-4c28-4d14-b996-f413540e300f">Dashboard
                                    Kinerja</a>
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

                    <td class="py-5" style="width: 80%">
                        <div class="berita">
                            <div class="judul">
                                <p class="fw-bold">BERITA KEGIATAN</p>
                            </div>
                            <article class="mb-5">
                                <div id="konten_berita">
                                    @if ($konten)
                                        <div style="color: red" id="tanggal_berita">{{ $konten->tanggal_berita }}</div>
                                        <div id="judul_berita">
                                            <h3><strong>{{ $konten->judul_berita }}</strong></h3>
                                        </div>
                                        <img class="mx-auto" src="{{ asset('storage/gambar/' . $fotos[0]->gambar) }}"
                                            alt="dokumentasi" width="100%" height="500px">
                                        <div id="isi_berita">{!! $konten->isi_berita !!}</div>
                                        <div class="container">
                                            <div class="row row-cols-4 gy-4">
                                                @for ($x = 1; $x < count($fotos); $x++)
                                                    <div class="col"> <img
                                                            src="{{ asset('storage/gambar/' . $fotos[$x]->gambar) }}"
                                                            alt="dokumentasi" width="100%" height="300px"></div>
                                                @endfor
                                            </div>
                                        </div>
                                        @can('view_informasi', auth()->user())
                                            <div class="d-flex justify-content align-items-center">
                                                <form method="POST" action="{{ route('beranda.destroy', $konten->id) }}"
                                                    onsubmit="return confirm('Apakah Anda yakin ingin menghapus berita ini?')">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger me-2">Hapus</button>
                                                </form>
                                                <button class="btn btn-info"
                                                    onclick="location.href='{{ route('beranda.edit', $konten->id) }}'">Edit</button>
                                            </div>
                                        @endcan
                                    @else
                                        <p>Tidak ada konten yang tersedia.</p>
                                    @endif
                                </div>
                            </article>

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
                <li><img src="{{ asset('css/whatsapp.png') }}" alt="whatsapp" width="24px">0812-3456-78910</li>
                <li><img src="{{ asset('css/google.png') }}" alt="gmail" width="24px">uip-sumbagsel@pln.co.id
                </li>
            </ul>
        </div>
        <div class="alamat">
            <h4>ALAMAT</h4>
            <ul class="list-unstyled column-2">
                <li><img src="{{ asset('css/location.png') }}" alt="maps" width="24px">Jl. Residen Abdul Rozak
                    No.2180, 2 Ilir, Kec. Kalidoni, Kota Palembang, Sumatera Selatan 30163</li>
            </ul>
        </div>
    </footer>

    <script src="{{ asset('https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js') }}"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
    </script>
    <script>
        CKEDITOR.replace('isi_berita');
    </script>
</body>

</html>
