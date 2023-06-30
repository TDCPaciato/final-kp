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
    {{-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"> --}}
    <style>
        .button-container {
            display: flex;
            justify-content: space-between;
            }

        .button-container button {
            margin-right: 10px;
        }
    </style>
    <title>PLN UIP Sumbagsel | Beranda</title>
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
                            <a class="nav-link active" aria-current="page" href="/beranda">Beranda</a>
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
                    </td>

                    <td class="py-5" width="60%">
                        <div class="berita">
                            @auth
                            <div class="container">
                                <div id="todo" class="column">
                                    <h2>Rencana Kegiatan</h2>
                                    <h3 id="todo-count">{{ $rencana_kegiatan }}</h3>
                                    Kegiatan <br>
                                    <div class="button-container">
                                        <button onclick="openModal('tambah-modal')">Tambah</button>
                                        <button onclick="openModal('detail-modal-tambah')">Detail</button>
                                    </div>
                                </div>
                    
                                <div id="doing" class="column">
                                    <h2>Sedang dilakukan</h2>
                                    <h3 id="doing-count">{{ $sedang_dilakukan }}</h3>
                                    Kegiatan <br>
                                    <button onclick="openModal('detail-modal-sedang')">Detail</button>
                                </div>
                    
                                <div id="done" class="column">
                                    <h2>Sudah Dilakukan</h2>
                                    <h3 id="done-count">{{ $sudah_dilakukan }}</h3>
                                    Kegiatan <br>
                                    <button onclick="openModal('detail-modal-sudah')">Detail</button>
                                </div>
                            </div>
                    
                            <!-- Modal Tambah -->
                            <div id="tambah-modal" class="modal fade" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Tambah Aktivitas</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="{{ route('kegiatan.store') }}" method="POST">
                                            @csrf
                                            <div class="modal-body">
                                                <div class="mb-3">
                                                    <label for="judul-kegiatan" class="form-label">Judul Kegiatan</label>
                                                    <input type="text" class="form-control" id="judul-kegiatan" name="judul_kegiatan"
                                                        placeholder="Masukkan judul kegiatan">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="isi-kegiatan" class="form-label">Isi Kegiatan</label>
                                                    <textarea class="form-control" id="isi-kegiatan" rows="4"
                                                        placeholder="Masukkan isi kegiatan" name="isi_kegiatan"></textarea>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                                <button type="submit" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">Simpan</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                    
                            <!-- Modal Detail Rencana -->
                            <div id="detail-modal-tambah" class="modal fade" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Detail Aktivitas</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            @if ($rencana_kegiatan > 0 && count($rencana) > 0)
                                                @foreach ($rencana as $item)
                                                <div class="row column">
                                                    <div class="col-7">
                                                        <h5>{{ $item->judul_kegiatan }}</h5>
                                                        <p>{{ $item->isi_kegiatan }}</p>
                                                    </div>
                                                    <div class="col-2">
                                                        <button class="btn btn-sm btn-info" data-bs-dismiss="modal" aria-label="Close" onclick="updateStatusKegiatan(1, {{ $item->id }})">
                                                            Pindah
                                                        </button>
                                                    </div>
                                                </div>
                                                @endforeach
                                            @else
                                                <p>Tidak ada kegiatan yang tersedia.</p>
                                            @endif
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    
                            <!-- Modal Detail Sedang -->
                            <div id="detail-modal-sedang" class="modal fade" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Detail Aktivitas</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            @if ($sedang_dilakukan > 0 && count($sedang) > 0)
                                                @foreach ($sedang as $item)
                                                <div class="row column">
                                                    <div class="col-7">
                                                        <h3>{{ $item->judul_kegiatan }}</h3>
                                                        <p>{{ $item->isi_kegiatan }}</p>
                                                    </div>
                                                    <div class="col-2">
                                                        <button class="btn btn-sm btn-info" data-bs-dismiss="modal" aria-label="Close" onclick="updateStatusKegiatan(2, {{ $item->id }})">
                                                            Pindah
                                                        </button>
                                                    </div>
                                                </div>
                                                @endforeach
                                            @else
                                                <p>Tidak ada kegiatan yang tersedia.</p>
                                            @endif
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    
                            <!-- Modal Detail Sudah -->
                            <div id="detail-modal-sudah" class="modal fade" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Detail Aktivitas</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            @if ($sudah_dilakukan > 0 && count($sudah) > 0)
                                                @foreach ($sudah as $item)
                                                <div class="row column">
                                                    <div class="col-7">
                                                        <h3>{{ $item->judul_kegiatan }}</h3>
                                                        <p>{{ $item->isi_kegiatan }}</p>
                                                    </div>
                                                </div>
                                                @endforeach
                                            @else
                                                <p>Tidak ada kegiatan yang tersedia.</p>
                                            @endif
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endauth
                    
                            <div class="judul">
                                <p class="fw-bold">BERITA KEGIATAN</p>
                            </div>
                    
                            @foreach ($data as $value)
                            <div id="konten">
                                <div style="color: red" id="tanggal_berita">{{ $value->tanggal_berita }}</div>
                                {{-- format tanggal {{ date('d F Y', strtotime($value->tanggal_berita)) }} --}}
                                <div id="judul_berita">
                                    <a href="{{ route('beranda.show', $value->id) }}">
                                        <h5><strong>{{ $value->judul_berita }}</strong></h5>
                                    </a>
                                </div>
                                <p>{!! substr($value->isi_berita, 0, 200) !!}{{ strlen($value->isi_berita) > 200 ? '...' : '' }}</p>
                                {{-- <img src="{{ asset('storage/gambar/' . $value->gambar) }}" alt="dokumentasi" width="100%" height="400px"> --}}
                            </div>
                            @endforeach
                    
                            <div class="d-flex justify-content-center">
                                {{ $data->links() }}
                            </div>
                    
                            <hr />
                            [ <a href="beranda_arsip">Arsip Berita</a> ]
                        </div>
                    </td>
                    


                    <td class="py-5" style="width: 20%">
                        <div class="pengumuman">
                            <div class="judul">
                                <p class="fw-bold">PENGUMUMAN</p>
                            </div>
                            @foreach ($terbaru as $item)
                                <div id="konten_pengumuman">
                                    <div style="color: red" id="tanggal_pengumuman">{{ $item->tanggal_pengumuman }}
                                    </div>
                                    <div id="isi_pengumuman">
                                        <a href="{{ route('pengumuman.show', $item->id) }}">
                                            <h5><strong>{{ $item->isi_pengumuman }}</strong></h5>
                                        </a>
                                    </div>
                                </div>
                            @endforeach
                            <hr />
                            [ <a href="pengumuman_arsip">Arsip Pengumuman</a> ]
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
                <li><img src={{ asset('css/google.png') }} alt="gmail" width="24px">uip-sumbagsel@pln.co.id
                </li>
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

    <script src="https://cdn.jsdelivr.net/npm/Sortable@1.13.0/Sortable.min.js"></script>
    <script src={{ asset('https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js') }}
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
    </script>

    <!-- Link ke file JavaScript Bootstrap -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    <script>
        function openModal(modalId) {
            var modal = new bootstrap.Modal(document.getElementById(modalId));
            modal.show();
        }

        function updateStatusKegiatan(status, kegiatanId) {
            // Kirim permintaan HTTP ke server untuk memperbarui status kegiatan
            fetch('/kegiatan/update-status', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': '{{ csrf_token() }}', // Ganti dengan token CSRF dari Laravel
                    },
                    body: JSON.stringify({
                        status: status,
                        kegiatan_id: kegiatanId
                    }),
                })
                .then(response => response.json())
                .then(data => {
                    // Tampilkan pesan atau lakukan tindakan lain setelah pembaruan berhasil
                    console.log(data);
                    window.location='/beranda';
                    // Lakukan tindakan lain, seperti memuat ulang halaman atau memperbarui tampilan
                })
                .catch(error => {
                    // Tangani kesalahan jika terjadi
                    console.error(error);
                });
        }
    </script>
</body>

</html>
