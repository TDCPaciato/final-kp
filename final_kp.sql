-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2023 at 11:06 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_kp`
--

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `konten_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`id`, `gambar`, `konten_id`, `created_at`, `updated_at`) VALUES
(1, 'foto-1686854845-648b5cbd29b1f.jpeg', 1, '2023-06-15 11:47:25', '2023-06-15 11:47:25'),
(2, 'foto-1686854895-648b5cef5d014.jpeg', 2, '2023-06-15 11:48:15', '2023-06-15 11:48:15'),
(3, 'foto-1686854944-648b5d2045432.jpeg', 3, '2023-06-15 11:49:04', '2023-06-15 11:49:04'),
(4, 'foto-1686855101-648b5dbd14c2e.jpeg', 4, '2023-06-15 11:51:41', '2023-06-15 11:51:41'),
(5, 'foto-1686855199-648b5e1f51fbf.jpeg', 5, '2023-06-15 11:53:19', '2023-06-15 11:53:19'),
(6, 'foto-1686855234-648b5e424195c.jpeg', 6, '2023-06-15 11:53:54', '2023-06-15 11:53:54'),
(7, 'foto-1686855284-648b5e74d3e39.jpeg', 7, '2023-06-15 11:54:44', '2023-06-15 11:54:44'),
(8, 'foto-1686855335-648b5ea70d3ea.jpeg', 8, '2023-06-15 11:55:35', '2023-06-15 11:55:35'),
(9, 'foto-1686855379-648b5ed36a0e8.jpeg', 9, '2023-06-15 11:56:19', '2023-06-15 11:56:19'),
(10, 'foto-1686855492-648b5f441a66b.jpeg', 10, '2023-06-15 11:58:12', '2023-06-15 11:58:12'),
(11, 'foto-1686855543-648b5f773df06.jpeg', 11, '2023-06-15 11:59:03', '2023-06-15 11:59:03'),
(12, 'foto-1686855680-648b600027a18.jpeg', 12, '2023-06-15 12:01:20', '2023-06-15 12:01:20'),
(13, 'foto-1686855854-648b60ae3897a.jpeg', 13, '2023-06-15 12:04:14', '2023-06-15 12:04:14'),
(14, 'foto-1686924661-648c6d7554774.jpeg', 14, '2023-06-16 07:11:01', '2023-06-16 07:11:01'),
(15, 'foto-1686924704-648c6da0ee84b.jpeg', 15, '2023-06-16 07:11:44', '2023-06-16 07:11:44'),
(16, 'foto-1686924746-648c6dcaf2582.jpeg', 16, '2023-06-16 07:12:26', '2023-06-16 07:12:26'),
(17, 'foto-1686924802-648c6e027bfc8.jpeg', 17, '2023-06-16 07:13:22', '2023-06-16 07:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul_kegiatan` varchar(255) NOT NULL,
  `isi_kegiatan` text NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `judul_kegiatan`, `isi_kegiatan`, `created_by`, `created_at`, `updated_at`, `status`) VALUES
(60, 'Menjadikan Isaac Newton menjadi ilmuan terkenal', 'Ketika aku sedang dibawah pohon apel, maka itulah awal mula dari kisah isaac tangis', 1, '2023-06-30 11:42:37', '2023-06-30 11:46:00', 2),
(61, 'Melakukan pendataan pembayaran', 'Pembayaran dari PT Bumi Tama kepada pihak PLN', 1, '2023-06-30 11:43:25', '2023-06-30 11:45:55', 1),
(62, 'Presentasi', 'Menjadi penyelia dari mahasiswa UMDP', 1, '2023-06-30 11:44:02', '2023-06-30 11:44:02', 0),
(63, 'Arsip Laporan', 'Mengarsip laporan dari bulan Juni', 1, '2023-06-30 11:45:37', '2023-07-01 06:04:08', 1),
(64, 'nizar', 'bakti sosial', 9, '2023-06-30 22:40:53', '2023-06-30 23:05:30', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kontens`
--

CREATE TABLE `kontens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_berita` date DEFAULT NULL,
  `judul_berita` varchar(255) NOT NULL,
  `isi_berita` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kontens`
--

INSERT INTO `kontens` (`id`, `tanggal_berita`, `judul_berita`, `isi_berita`, `created_at`, `updated_at`, `created_by`) VALUES
(1, '2023-05-16', 'Hadir di PEVS 2023, PLN Ajak Masyarakat Pangkas Emisi Karbon Pakai Kendaraan Listrik', '<p>PT PLN (Persero) mendukung penyelenggaraan Periklindo Electric Vehicle Show (PEVS) yang berlangsung pada 17 hingga 21 Mei 2023 di JIEXPO Kemayoran Jakarta. Berkolaborasi dengan Perkumpulan Industri Kendaraan Listrik Indonesia (Periklindo), PLN menunjukkan komitmennya bersama pemerintah untuk mencapai <i>net zero emission</i> di tahun 2060.</p><p>Direktur Utama PLN Darmawan Prasodjo mengatakan pameran kendaraan listrik ini diharapkan dapat mengakselerasi pengembangan ekosistem kendaraan listrik di Indonesia. Pada gelaran ini PLN membuka <i>booth</i> untuk menyosialisasikan penggunaan kendaraan listrik yang murah dan ramah lingkungan serta kesiapan infrastruktur <i>supporting.</i></p><p>“Untuk mendukung adopsi kendaraan listrik di Indonesia, Kolaborasi BUMN turut berpartisipasi dalam kegiatan ini untuk mengajak masyarakat peduli dan terlibat aktif dalam menjaga lingkungan dengan beralih ke kendaraan listrik,” kata Darmawan.</p><p>Dirinya mengatakan beralih ke kendaraan listrik menjadi pilihan strategis mengingat sektor transportasi menjadi salah satu penyumbang utama emisi karbon di Indonesia.</p><p>Darmawan juga membandingkan emisi dari kendaraan BBM dan listrik. Dimana 1 liter BBM sama dengan 1,2 kWh listrik, tetapi emisi karbon 1 liter BBM adalah 2,4 kg CO2e sedangkan emisi karbon 1,2 kWh listrik adalah 1,3 kg CO2e.</p><p>“Artinya menggunakan kendaraan listrik ini, sudah mengurangi hampir 50 persen emisi karbon,” tambah Darmawan.</p><p>Darmawan juga menjelaskan bahwa penggunaan kendaraan listrik akan bermanfaat terhadap kedaulatan energi nasional. Di mana adanya peralihan dari energi berbasis impor yang kotor dan mahal menuju energi berbasis domestik yang murah dan bersih.</p><p>“PLN berkomitmen untuk bersama-sama membangun sebuah ekosistem kendaraan listrik yang kokoh, produktif dan berdaya saing. Tujuannya untuk menciptakan lingkungan yang lebih bersih dan memberikan manfaat ekonomis bagi pengguna kendaraan listrik, serta mewujudkan kedaulatan energi nasional,” tambah Darmawan.</p><p>Sebagai komitmen mendukung peralihan ke kendaraan listrik PLN memastikan ketersediaan pasokan listrik. Tidak hanya itu PLN juga telah mengoperasikan sebanyak 616 Stasiun Pengisian Kendaraan Listrik Umum (SPKLU) dan 1.163 unit Stasiun Penukaran Baterai Kendaraan Listrik Umum (SPBKLU) di seluruh Indonesia.</p><p>Darmawan mengajak kepada seluruh masyarakat untuk berkunjung ke <i>booth</i> PLN di PEVS 2023 dan membuktikan sendiri kelebihan menggunakan kendaraan listrik. Dalam pameran ini masyarakat berkesempatan untuk melakukan <i>test drive</i> kendaraan listrik secara langsung. Di samping itu pengunjung juga dapat langsung mengakses insentif yang diberikan pemerintah untuk pembelian kendaraan listrik dengan syarat dan ketentuan yang berlaku.</p><p>“Kami mengajak masyarakat untuk berkunjung ke <i>booth</i> PLN, pada kesempatan ini masyarakat bisa langsung menjajal kendaraan listrik dan motor konversi melalui <i>test drive</i> yang disediakan. Peralihan menuju transportasi berbahan bakar listrik adalah revolusi bersama menuju masa depan transportasi yang lebih murah dan ramah lingkungan,” pungkas Darmawan.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat dan TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-15 11:47:25', '2023-06-15 11:47:25', 1),
(2, '2023-05-16', 'Wishnutama: KTT ASEAN Labuan Bajo Sukses, Apresiasi Dukungan Listrik Andal PLN', '<p>Konferensi Tingkat Tinggi (KTT) ASEAN ke-42 di labuan Bajo sukses digelar. Keberhasilan ini tak lepas dari dukungan kelistrikan yang andal dari PT PLN (Persero) yang sekaligus melayani kebutuhan untuk kendaraan listrik yang digunakan para delegasi sepanjang perhelatan KTT. Menunjukkan kepada dunia internasional, Indonesia mampu mengimplementasi dan mengakselerasi penggunaan kendaraan listrik.</p><p>Tim Asistensi dan Kemitraan Keketuaan Indonesia, Wishnutama Kusubandio mengatakan, suksesnya pelaksanaan KTT ASEAN ke-42 di Labuan Bajo ini tidak lepas dari dukungan sistem kelistrikan PLN.</p><p>“Kita sangat bersyukur gelaran internasional KTT ASEAN ke-42 di Labuan Bajo telah terlaksana dengan lancar. Kami juga mengapresiasi listrik yang begitu andal dari PLN sehingga turut mendukung penyelenggaraan KTT,” kata Wishnutama.</p><p>Wishnutama mengatakan, PLN tidak hanya memastikan pasokan listrik aman tetapi juga menyiagakan para personel di setiap <i>venue</i> acara. Sehingga, pelaksanaan acara berjalan lancar tanpa gangguan kelistrikan.</p><p>“Bahkan, tidak hanya pasokan listriknya, para personel PLN juga sangat sigap membantu panitia dalam menyiapkan instalasi di tiap v<i>enue</i> acara,” tambahnya.</p><p>Tak hanya pasokan listrik, PLN juga memastikan kendaraan listrik dan infrastruktur pendukungnya tersedia selama KTT ASEAN berlangsung. Anggota Tim <i>Sweeper</i> untuk tamu negara Kamboja, Nurul Rahman menjelaskan mobil listrik sangat membantu tugas pengamanan selama KTT ASEAN ke-42. Dari sisi operasional dan pengisian daya, semuanya lancar dan tanpa kendala sama sekali.</p><p>Menurutnya, PLN juga telah menyiapkan semua infrastruktur pengisian daya kendaraan listrik di setiap sudut di Labuan Bajo. Ketersediaan Stasiun Pengisian Kendaraan Listrik Umum (SPKLU) dan petugas siaga sangat membantu dan memudahkan proses pengisian daya kendaraan listrik.</p><p>“Untuk layanan SPKLU dari teman-teman PLN, alhamdulillah selama tiga hari ini saya pakai tidak ada kendala dalam pengecasan. Semua lancar hingga kegiatan dinyatakan selesai,” ungkap anggota Polri yang ditugaskan dari Polda Jabar tersebut.</p><p>Rahman pun bersyukur acara KTT ASEAN ke-42 bisa berjalan lancar hingga selesai. Berdasarkan pengalaman ini, ia berharap ke depan penggunaan kendaraan listrik akan semakin masif di Indonesia.</p><p>“Mudah-mudahan ke depannya untuk penggunaan kendaraan listrik berjalan lancar. Sehingga operasional kendaraan listrik akan semakin efektif lagi,” tambah Rahman.</p><p>Hal serupa juga disampaikan oleh Muhammad Nadir, pengemudi VVIP bagi negara Brunei Darussalam yang merasakan kenyamanan ketika mengendarai mobil listrik dan melakukan pengisian daya di SPKLU.</p><p>“Mobil listrik ini sangat bagus, karena bisa mengurangi emisi dan membuat udara kita lebih baik lagi untuk generasi mendatang,” tutur Nadir.</p><p>Nadir juga mengungkapkan pelayanan di SPKLU sangat baik. Petugas Siaga PLN yang bekerja 24 jam bergerak dengan sigap dan tak kenal waktu dalam memberikan pelayanan pengisian daya di setiap pos SPKLU.</p><p>“Pelayanan SPKLU di sini sangat bagus, dan siap melayani mau jam berapa saja, kami selalu bisa dilayani dengan baik. Saya berterima kasih untuk PLN karena sudah mendukung acara KTT ASEAN ke-42 di Labuan Bajo ini,” pungkas Nadir.</p><p>Sebelumnya, Direktur Utama PLN Darmawan Prasodjo menjelaskan, untuk mendukung pengoperasian SPKLU selama KTT ASEAN, PLN telah menyiagakan ratusan petugas di seluruh titik pengisian daya kendaraan listrik.</p><p>“Kami memastikan keandalan pasokan daya listrik dan ketersediaan SPKLU di titik-titik strategis di Labuan Bajo. Sehingga memudahkan pengisian daya kendaraan listrik untuk mendukung KTT ASEAN ini,” ungkap Darmawan.</p><p>Dirinya juga mengungkapkan terima kasih atas apresiasi para pengguna fasilitas kendaraan listrik di KTT ASEAN. Hal ini muncul tentunya juga berkat dari pengalaman PLN mendukung<i> event</i> internasional sebelumnya, seperti KTT G20 di Bali tahun lalu.</p><p>“Nah, hari ini ternyata tim PLN makin hari makin trengginas. Dari pengalaman tahun lalu, muncullah <i>core competency</i> dan <i>technical skill</i> baru sehingga layanan kelistrikan dan SPKLU di KTT ASEAN ini semakin andal,” tutup Darmawan.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat &amp; TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-15 11:48:15', '2023-06-15 11:48:15', 1),
(3, '2023-05-17', 'Operasikan PLTM Kanzy, PLN Tambah 16 Pembangkit Hijau untuk Pasok Kelistrikan di Jawa Timur', '<p>PT PLN (Persero) menambah pasokan listrik dari energi bersih di wilayah Jawa Timur dengan mengoperasikan Pembangkit Listrik Tenaga MiniHidro (PLTM) Kanzy. Pengoperasian green power plant yang berada di Pasuruan ini pun menambah deretan pembangkit Energi Baru Terbarukan (EBT) menjadi 16 dari total 32 pembangkit yang ada di Jawa Timur.</p><p>Direktur Utama PLN, Darmawan Prasodjo mengatakan langkah yang dilakukan PLN ini selaras dengan upaya pemerintah untuk meningkatkan bauran Energi Baru Terbarukan (EBT) menuju <i>Net Zero Emission</i> pada tahun 2060.</p><p>“PLN terus mendukung upaya mengurangi emisi karbon salah satunya dengan menggenjot pembangunan pembangkit listrik berbasis energi baru terbarukan. Beroperasinya PLTM Kanzy ini akan menyuplai listrik ke 10 ribu lebih pelanggan dengan kapasitas daya sebesar 2 x 1,25 Megawatt (MW),” terang Darmawan.</p><p>Sementara itu General Manager PLN Unit Induk Distribusi Jawa Timur, Lasiran mengatakan saat ini kelistrikan di Jawa Timur disupport dari berbagai pembangkit EBT di antaranya PLTM dan akan bertambah lagi ke depannya.</p><p>“Saat ini sistem kelistrikan Jawa Timur disuplai 5 PLTM&nbsp;yang dikelola sendiri maupun yang berasal dari <i>Independent Power Producer</i> (IPP) di antaranya yakni PLTM Lodagung kapasitas 2 x 0,65 MW, PLTM Taman Asri 1,17 MW, PLTM Ampel Gading 2 x 5 MW, PLTM Sampean Baru 1,85 MW, dan yang baru <i>Comissioning Operation Date</i> (COD) ada PLTM Kanzy ini,” kata Lasiran.</p><p>Lasiran menjelaskan, daerah Jawa Timur memiliki potensi aliran air melimpah yang bisa dimanfaatkan sebagai PLTM. Untuk itu, PLTM menjadi pilihan utama dalam mendukung kebutuhan listrik masyarakat.</p><p>Dirinya mengatakan, untuk menambah bauran energi terbarukan, pada tahun ini PLN tengah dalam proses konstruksi PLTM Sumber Arum 2 berkapasitas 3 MW dan PLTM Bayu berkapasitas 3,6 MW di Banyuwangi.</p><p>“PLN pun melakukan kajian untuk potensi pengembangan EBT di Jawa Timur. Pengembangan EBT dirancang dengan tetap mempertimbangkan<i> supply and demand</i>, potensi energi terbarukan setempat, keekonomian, keandalan, ketahanan dan kesinambungan sistem energi nasional,” kata Lasiran.</p><p>Lasiran juga menambahkan, potensi pengembangan EBT di Jawa Timur yakni sebesar 779,9 MW mulai dari Pembangkit Listrik Panas Bumi (PLTP) di kawasan Gunung Wilis, Arjuno, Pandan Argopuro, Krucil, kemudian Pembangkit Listrik Tenaga Bayu (PLTB) di Banyuwangi, Probolinggo, Tuban, PLTS di kepulauan, serta PLTS dan PLTB (Hybrid) di Tuban.</p><p>“Kami akan terus berupaya memanfaatkan potensi sumber energi baru terbarukan untuk mendukung kebutuhan masyarakat akan listrik”, pungkasnya.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat &amp; TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-15 11:49:04', '2023-06-15 11:49:04', 1),
(4, '2023-05-17', 'PLN Dukung Masyarakat Gunakan Motor Listrik, Bisa Hemat Biaya Operasional Hingga 75%', '<p>PT PLN (Persero) terus menunjukkan dukungannya dalam pengembangan ekosistem kendaraan listrik di tanah air. Hitungan PLN, menggunakan kendaraan listrik mampu menghemat biaya operasional hingga 75 persen. Pada gelaran Periklindo Electric Vehicle Show (PEVS) 2023 yang akan berlangsung pada 17 hingga 21 Mei 2023 di JIEXPO Kemayoran, PLN menampilkan <i>showcase</i> ekosistem kendaraan listrik ini.</p><p>Direktur Utama PLN Darmawan Prasodjo mengatakan, beralih ke motor dan mobil listrik punya keuntungan berlipat dari sisi ekonomi. Perbandingannya cukup jauh, dengan asumsi tarif listrik sebesar Rp1.699 per kilowatt hour( kWh), hanya diperlukan sekitar Rp2.500 untuk sepeda motor listrik menempuh jarak 50 kilometer (km) dan 10 km untuk mobil listrik. Sedangkan, jika menggunakan BBM harus menghabiskan sekitar Rp14 ribu untuk menempuh jarak yang sama.</p><p>“Ini adalah salah satu bentuk keberpihakan Negara terhadap masyarakat untuk meringankan biaya transportasi rakyat. Dengan menggunakan motor listrik, masyarakat lebih hemat biaya 75 persen dibanding menggunakan sepeda motor berbasis BBM,” ujar Darmawan.</p><p>Darmawan juga menambahkan dengan menggunakan kendaraan listrik masyarakat juga akan mendapatkan manfaat penghematan tambahan dalam sisi perawatan.</p><p>“Motor atau mobil listrik tidak memerlukan penggantian oli. Selain itu, <i>spare part</i> motor maupun mobil listrik juga lebih sedikit jika dibandingkan dengan motor ataupun mobil berbasis BBM,” ucap Darmawan.</p><p>Lebih lanjut Darmawan meyakinkan bahwa ekosistem kendaraan listrik di Indonesia kini telah semakin kuat. Dari sektor hulu, melalui Indonesia Battery Corporation (IBC), Kementerian BUMN telah mendorong terciptanya industri baterai dalam negeri.</p><p>Lebih dari itu, infrastruktur ekosistem kendaraan listrik tanah air juga telah siap digunakan dengan disediakannya Stasiun Penukaran Baterai Kendaraan Listrik Umum (SPBKLU), Stasiun Pengisian Kendaraan Listrik Umum (SPKLU), layanan pengisian baterai di rumah atau <i>Home Charging</i>, hingga platform one stop services untuk pemilik kendaraan listrik yaitu <i>Electric Vehicle Digital Services</i> (EVDS) yang tersedia di aplikasi PLN Mobile.</p><p>“Harapannya, akan terjadi <i>shifting</i> baik di hulu maupun di hilir dari energi berbasis impor yang kotor dan mahal menjadi energi berbasis dalam negeri yang murah, ramah lingkungan dan dapat mereduksi emisi karbon,” ungkapnya.</p><p>Oleh sebab itu, ia mengajak kepada seluruh elemen masyarakat untuk berkunjung langsung dalam PEVS 2023 dan merasakan bagaimana ekosistem kendaraan ramah lingkungan ini telah siap diterapkan di Indonesia. Di pameran kendaraan listrik terbesar di Indonesia ini juga disediakan berbagai fasilitas untuk masyarakat bisa merasakan sendiri kemudahan menggunakan kendaraan listrik melalui fasilitas <i>test drive.</i></p><p>“Semoga langkah ini mengawali langkah-langkah besar selanjutnya kita dalam terus memperluas ekosistem <i>electric vehicle</i> (EV) di Indonesia. Peralihan menuju transportasi berbasis listrik adalah upaya bersama yang dapat berdampak signifikan untuk lingkungan dan masa depan anak-cucu kita,” tutup Darmawan.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat dan TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-15 11:51:41', '2023-06-15 11:51:41', 1),
(5, '2023-05-17', 'PEVS 2023 Resmi Dibuka, PLN Tampilkan Infrastruktur Pendukung Ekosistem Kendaraan Listrik di Indonesia', '<p>Kepala Staf Kepresidenan Indonesia sekaligus Ketua Umum Perkumpulan Industri Kendaraan Listrik Indonesia (Periklindo) Jend (Purn) Dr. Moeldoko membuka pagelaran Periklindo Electric Vehicle Show (PEVS), 17 Mei 2023 di JIEXPO Kemayoran Jakarta. Pameran kendaraan listrik ini diharapkan mampu mendorong keinginan masyarakat untuk beralih dari kendaraan BBM ke kendaraan listrik.</p><p>Moeldoko mengatakan saat ini seluruh dunia bergerak melakukan transisi ke kendaraan yang lebih ramah lingkungan. Semangat yang sama juga terlihat saat KTT ASEAN ke- 42 yang telah berlangsung di Labuan Bajo. Moeldoko menilai, semangat bersama negara ASEAN ini menjadi signal positif untuk Indonesia menjadi motor penggerak industri kendaraan listrik di kawasan.</p><p>“Para pemimpin ASEAN sepakat dalam membangun sistem untuk berkembangnya electric vehicle (EV) di seluruh negara ASEAN. Semua sepakat untuk membangun sistem bersama agar ASEAN bisa menjadi pusat pertumbuhan EV global,” kata Moeldoko.</p><p>Moeldoko menambahkan, Indonesia bersama negara ASEAN lain juga bersepakat untuk mengembangan industri baterai. Indonesia yang sudah lebih dulu melakukan trobosan terbuka untuk melakukan kolaborasi dalam hal penelitian dan juga pengembangan industri.</p><p>“Dua hal ini menunjukkan bahwa Indonesia menjadi faktor pengungkit akan perkembangan mobil listrik dunia. Ini luar biasa, kenapa demikian? Kesepakatan itu dilakukan pada saat Indonesia menjadi Ketua ASEAN Summit kemarin,” lanjutnya.</p><p>Moeldoko juga menekankan bahwa dengan beralih pada kendaraan listrik ini merupakan langkah dalam menjaga kepentingan dunia yang semakin bersih untuk keberlanjutan masa depan bangsa dan dunia.</p><p>“Untuk itu, saya berharap teman–teman, para pengusaha, fasilitator, pemegang kebijakan jangan ragu–ragu, bahwa EV adalah kendaraan masa depan,” pungkasnya.</p><p>Direktur Utama PLN, Darmawan Prasodjo mengatakan PLN mendukung penuh pameran ini sebagai bukti nyata hadirnya BUMN untuk mendukung ekosistem kendaraan listrik di Indonesia.</p><p>“PLN akan terus mendukung segala program Pemerintah untuk percepatan ekosistem kendaraan listrik. Salah satunya dengan menghadirkan PLN Mobile sebagai one stop solution bagi pengguna kendaraan listrik,” ucap Darmawan.</p><p>Dirinya menambahkan, PLN juga memiliki skema kerja sama dengan berbagai pihak untuk membangun bisnis Stasiun Pengisian Kendaraan Listrik Umum (SPKLU) dan Stasiun Penukaran Baterai Kendaraan Listrik Umum (SPBKLU).</p><p>“Dengan adanya skema <i>franchise</i> ini, kami yakin SPKLU dan SPBKLU akan semakin tumbuh subur, bak jamur di musim hujan. Ini juga akan membuat orang semakin yakin untuk menggunakan kendaraan listrik untuk perjalanan jarak jauh,” kata Darmawan.</p><p>PLN terus berkomitmen untuk bersama-sama membangun sebuah ekosistem kendaraan listrik yang sangat kokoh, solid, produktif, dan berdaya saing.</p><p>“Peralihan ke kendaraan listrik ini akan membantu mengurangi penggunaan energi berbasis impor yang kotor dan mahal ke energi berbasis domestik yang bersih dan murah, sehingga diharapkan mengurangi impor BBM yang semakin meningkat dari tahun ke tahun,” jelas Darmawan.</p><p>Adapun PLN membuka <i>booth</i> bagi para pengunjung PEVS yang ingin menjajal langsung sensasi menggunakan kendaraan listrik. PEVS merupakan pameran yang diselenggarakan oleh Periklindo dan Dyandra Promosindo yang akan berlangsung pada 17 hingga 21 Mei 2023 di JIEXPO Kemayoran Jakarta.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat dan TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-15 11:53:19', '2023-06-15 11:53:19', 1),
(6, '2023-05-18', 'Manfaatkan Potensi EBT di Flores, Gubernur NTT Dukung Penuh PLN Kembangkan PLTP Ulumbu', '<p>PT PLN (Persero) terus mengembangkan Pembangkit Listrik Tenaga Panas Bumi (PLTP) Ulumbu di Poco Leok, Manggarai, Nusa Tenggara Timur (NTT). PLTP ini diproyeksikan mampu memenuhi peningkatan permintaan listrik di NTT dan meningkatkan pasokan energi bersih nasional.</p><p>Gubernur NTT Viktor Bungtilu Laiskodat mengungkapkan potensi energi baru terbarukan (EBT) yang dimiliki NTT bisa menjadi modal menjalankan transisi energi. Sebab itu pihaknya memberikan dukungan penuh kepada PLN dalam mengembangkan pembangkit tamah lingkungan demi memaksimalkan potensi besar tersebut.</p><p>Dirinya juga mengatakan bahwa saat ini Provinsi NTT masih menjadi salah satu yang termiskin di Indonesia. Menurutnya, NTT miskin bukan karena tidak punya kekayaan, tetapi karena kekayaannya belum dimanfaatkan.</p><p>“Dengan dukungan PLN, Provinsi ini akan menjadi salah satu yang terkaya di Indonesia pada 15–20 tahun mendatang. Karena kalau <i>renewable energy</i> menjadi panduan untuk energi masa depan, maka NTT salah satu lumbung dari EBT,” jelas Viktor.</p><p>Viktor mengatakan salah satu potensi EBT yang bisa dikembangkan untuk pembangkit listrik adalah panas bumi yang ada di Ulumbu. Pihaknya telah mendiskusikan pengembangan PLTP Ulumbu secara langsung dengan Direktur Utama PLN, Darmawan Prasodjo, saat penyelenggaraan KTT ASEAN di Labuan Bajo. Dirinya menilai, proyek pengembangan panas bumi perlu terus didorong sebagai alternatif mengurangi ketergantungan pada bahan bakar fosil dan menurunkan emisi karbon.</p><p>“Saya meminta masyarakat untuk mendukung keseriusan pemerintah melalui PLN dalam mengolah potensi panas bumi di Pulau Flores, termasuk pengembangan PLTP Ulumbu. Saya harapkan seluruh komponen ikut terlibat untuk membantu sehingga program ini berjalan lancar,” ucapnya.</p><p>Lebih lanjut Viktor mengatakan ketersediaan listrik bersih akan membuka potensi pengembangan ekonomi seluruh masyarakat NTT. Termasuk sektor pariwisata yang punya potensi besar untuk jadi destinasi dunia seperti Labuan Bajo.</p><p>“Orang tidak mau masuk hotel kalau energi listriknya bersumber dari energi fosil. Pengembangan PLTP Ulumbu adalah bagian dari upaya kita membenahi ini semua,” ujar Viktor.</p><p>General Manager PLN Unit Induk Pembangunan Nusa Tenggara (UIP Nusra) Abdul Nahwan menuturkan saat ini kebutuhan energi listrik di NTT mengalami pertumbuhan cukup pesat. Sehingga penambahan pasokan listrik, khususnya dari pembangkit EBT sangat dibutuhkan.</p><p>“Pemanfaatan potensi panas bumi PLTP Ulumbu ini sejalan dengan <i>road map</i> percepatan peningkatan bauran EBT nasional demi mencapai NZE pada 2060. Adapun pengembangan PLTP Ulumbu unit 5 dan 6 ini berkapasitas total 40 megawatt,” jelas Nahwan.</p><p>Dirinya menambahkan saat ini pembangunan perluasan PLTP Ulumbu telah memasuki tahap survei dan pembebasan lahan. Sebelumnya, PLN juga telah mengoperasikan PLTP Ulumbu unit 1-4 dengan kapasitas total 10 MW.</p><p>Nahwan menjelaskan kehadiran PLTP menjadi sangat penting karena sifatnya <i>sustainable&nbsp;</i>yaitu dapat menghasilkan energi berkelanjutan sehingga tersedia untuk jangka waktu yang panjang. Energi ini juga <i>reliable</i> yakni tidak tergantung pada kondisi cuaca.</p><p>“Berbeda dengan PLTS dan PLTB, PLTP ini tidak bersifat <i>intermittent</i>, sehingga akan lebih andal bagi sistem kelistrikan. Keunggulan lain energi panas bumi adalah <i>direct use</i>&nbsp;atau dapat dipakai langsung ke pengguna akhir. Kemudian dapat menciptakan lapangan kerja, tidak ada polusi dan ramah lingkungan,” pungkas Nahwan.</p><p><strong>Narahubung</strong><br>Grahita Muhammad<br>Vice President Komunikasi Korporat PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-15 11:53:54', '2023-06-15 11:53:54', 1),
(7, '2023-05-19', 'Kolaborasi BUMN, PLN Pasok Kebutuhan Listrik Pertamina EP Papua Field Klamono', '<p>PT PLN (Persero) memasok kebutuhan listrik Pertamina EP sebesar 2.075 kiloVolt Ampere (kVA) untuk operasional <i>site</i> Klamono, di Sorong, Papua Barat. Dengan menggunakan listrik PLN, Pertamina EP Papua Field (PEP Papua) akan mengurangi penggunaan pembangkit diesel sendiri dan berpindah menggunakan listrik PLN.</p><p>Manager PT Pertamina EP Papua Field Site Klamono, Muslim Nugraha, menyampaikan apresiasi atas terealisasinya penyambungan listrik ke <i>site</i> Klamono, dirinya berharap kerja sama ini dapat membantu produksi migas lebih efisien.</p><p>“Kerja sama ini akan menurunkan biaya per barel untuk produksi migas kami, menurunkan emisi karbon secara signifikan, dan mendayagunakan anggaran yang dihemat untuk program kerja lain dalam meningkatkan produksi migas. Ke depannya, kami yakin PLN dapat memberikan layanan listrik yang andal, berkualitas, dan terbaik,” ungkap Muslim.</p><p>Muslim mangatakan, PEP Papua kini dapat lebih fokus pada operasional dan pengembangan bisnis intinya. Dengan pasokan listrik PLN, PEP site Klamono berpotensi menghemat penggunaan 828.000 liter solar per tahun atau setara dengan Rp 18 miliar dan menurunkan emisi karbon sebesar ekuivalen 253 ton CO2 .</p><p>General Manager PLN Unit Induk Wilayah Papua dan Papua Barat, Budiono menjelaskan kolaborasi BUMN ini dilakukan dengan memberi layanan <i>Captive Power Acquisition</i>. Dengan program tersebut, para pelaku bisnis dapat menghentikan pembangkit milik sendiri dan beralih ke listrik PLN, sehingga para pelaku bisnis bisa fokus meningkatkan produktivitas usahanya.</p><p>“PLN siap menghadirkan listrik yang andal sehingga produksi migas Pertamina EP makin meningkat. Tentunya, kami di PLN siap memberikan layanan terbaik, tidak hanya untuk Pertamina EP Papua Field, tapi untuk pada seluruh pelaku bisnis yang ada,” kata Budiono.</p><p><strong>Narahubung</strong><br>Grahita Muhammad<br>Vice President Komunikasi Korporat PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-15 11:54:44', '2023-06-15 11:54:44', 1),
(8, '2023-05-20', 'Kampanyekan #PakaiMolis, BUMN Yakinkan Masyarakat Untuk Beralih ke Kendaraan Listrik', '<p>Badan Usaha Milik Negara (BUMN) saling bersinergi untuk memberikan edukasi dan mengajak masyarakat beralih dari kendaraan BBM ke kendaraan listrik. Lewat <i>booth</i> #PakaiMolis, BUMN menunjukkan bahwa Indonesia kini sudah memiliki ekosistem kendaraan listrik yang sangat komprehensif.</p><p>Menteri BUMN Erick Thohir menjelaskan BUMN hadir untuk mempercepat penetrasi kendaraan listrik di Indonesia. Hal ini dilakukan mengingat Indonesia memiliki cadangan mineral bahan baku kendaraan listrik. Lewat kolaborasi BUMN, Indonesia mengambil peran utama dalam industri kendaraan listrik.</p><p>“Lewat pameran PEVS 2023 kami hadir langsung menyapa masyarakat untuk memberikan keyakinan kepada masyarakat bahwa kita, Indonesia siap untuk beralih ke kendaraan listrik, kami di BUMN bersinergi membentuk ekosistem dari hulu hingga hilir,” ujar Erick.</p><p>Dalam booth #PakaiMolis, BUMN menghadirkan baterai kendaraan listrik yang diproduksi oleh Indonesian Batery Coorporation (IBC). Dengan memaksimalkan cadangan mineral di Indonesia, baterai besutan IBC merupakan produk dalam negeri yang berkualitas dengan harga kompetitif.</p><p>Kendaraan listrik tentu tak lepas dari kebutuhan pasokan listrik. PLN memegang peranan penting dalam hal ini. Tak hanya menghadirkan listrik yang andal dan berasal dari energi hijau, PLN bersama Pertamina juga memastikan kemudahan bagi masyarakat pemilik kendaraan listrik terkait infrastruktur pendukung pengisian daya.</p><p>Selain itu, dari sisi pembiayaan, masyarakat yang ingin beralih menggunakan kendaraan listrik juga diberi berbagai kemudahan dengan kebijakan Pemerintah yang menetapkan pemberian insentif motor listrik sebesar Rp7 juta per unit. Hadir juga dukungan dari Himpunan Bank Milik Negara (Himbara) diantaranya BNI, BRI dan Mandiri yang siap memberikan berbagai kemudahan khususnya terkait skema pembiayaan pembelian kendaraan listrik bagi masyarakat.</p><p>Lewat PEVS 2023 ini BUMN hadir langsung menyapa masyarakat. Dengan PEVS 2023 BUMN hendak menunjukan kepada masyarakat betapa mudahnya mengakses kendaraan listrik.</p><p>“Peralihan menuju transportasi berbahan bakar listrik tentunya akan meningkatkan ketahanan energi nasional. Selain dari itu upaya tersebut akan mendukung masa depan transportasi yang jauh lebih murah dan ramah lingkungan,” tutup Erick.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat dan TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-15 11:55:35', '2023-06-15 11:55:35', 1),
(9, '2023-05-20', 'Berhasil Tranformasikan Budaya Perusahaan yang Kian Positif dan Inovatif, PLN Corporate University Raih Penghargaan Internasional', '<p>PT PLN (Persero) berhasil meraih pengakuan internasional dalam implementasi transformasi budaya melalui penghargaan yang diterima PLN <i>Corporate University</i> (PLN CorpU). PLN CorpU berhasil mendapatkan penghargaan tertinggi kategori <i>Gold Award</i> untuk kategori culture pada ajang <i>Global Council of Corporate University</i> (GCCU) Forum di Bangalore, India.</p><p>GCCU merupakan lembaga internasional yang berpusat di Paris, Prancis yang mendorong perusahaan dalam berbagi dan melakukan implementasi praktik-praktik <i>corporate university</i> yang luar biasa. Melalui kompetisi ini, GCCU memberikan pengakuan dan apresiasi kepada perusahaan yang berhasil menjalankan transformasi organisasi yang inspiratif dan inovatif.</p><p>Direktur Utama PLN Darmawan Prasodjo mengatakan penghargaan ini merupakan buah manis dari upaya transformasi yang dilakukan perseroan di setiap <i>business process</i> PLN.</p><p>“Tiga tahun lalu, kita melakukan transformasi di semua lini bisnis PLN mulai dari pembangkitan, transmisi, distribusi, ritel, termasuk organisasi. Kita ubah kultur seluruh pegawai, cara kerja dan pengambilan keputusan. Dari kultur <i>bureaucratic-like</i> menjadi <i>business-like.</i> Kami ubah sistem layanan pelanggan dari lambat dan tidak responsif menjadi cepat, responsif, dan sangat memuaskan,” terang Darmawan.</p><p>Sementara itu General Manager PLN CorpU Rio Adrianto mengatakan, dalam ajang GCCU kali ini, PLN CorpU berhasil meraih peringkat yang mengesankan. Penghargaan ini merupakan bukti nyata PLN dan PLN CorpU mampu menjadi katalis dalam mengubah budaya perusahaan menjadi lebih inklusif, inovatif, dan berorientasi pada keunggulan dan menjadi model dan contoh di dunia.</p><p>“Penghargaan ini adalah hasil dari kerja keras dan dedikasi tim kami serta semangat perubahan yang kuat di PLN. Kami sangat berterima kasih kepada <i>ranger</i> terbaik PLN dan seluruh tim yang telah mendukung perubahan budaya PLN,” kata Rio.</p><p>Rio melanjutkan, PLN CorpU sebagai lembaga <i>learning and development</i> di PLN telah memegang peran penting dalam mendorong transformasi budaya perusahaan. Melalui pendekatan inovatif dan program pelatihan yang strategis, PLN CorpU telah berhasil mengubah paradigma dan sikap pegawai PLN serta menciptakan lingkungan kerja yang kolaboratif, dan mendorong pencapaian yang luar biasa.</p><p>“Dengan keberhasilan PLN CorpU saya berharap perusahaan-perusahaan di Indonesia dan seluruh dunia terinspirasi untuk melakukan perubahan budaya yang positif. PLN CorpU telah membuktikan bahwa dengan komitmen yang kuat, inovasi, dan kerja keras semua pihak, perubahan budaya perusahaan dapat tercapai dengan maksimal,” pungkas Rio.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat &amp; TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-15 11:56:19', '2023-06-15 11:56:19', 1),
(10, '2023-05-20', 'Kolaborasi BUMN, PLN Gandeng Biofarma Group Sediakan Layanan Kesehatan Pegawai dan Pensiunan', '<p>PT PLN (Persero) menjalin kolaborasi bersama Biofarma Group melalui anak usahanya Kimia Farma guna memastikan pelayanan kesehatan prima bagi karyawan hingga pensiunan. Kolaborasi ini ditandai dengan penandatanganan <i>Memorandum of Understanding</i> (MoU) antara Direktur Utama Holding BUMN Farmasi Honesti Basyir dan Direktur Utama PLN Darmawan Prasodjo di Jakarta, Jumat (19/5).</p><p>Direktur Utama PLN Darmawan Prasodjo menyampaikan, di tengah produktivitas pegawai yang semakin meningkat, PLN akan terus berupaya meningkatkan pelayanan kesehatan bagi karyawan dan pensiunan. Komitmen PLN yang terus bertransformasi di sektor kelistrikan harus disertai dengan peningkatan pelayanan kesehatan dan kesejahteraan bagi para pegawai.</p><p>“Kami ingin meningkatkan pelayanan kesehatan bagi seluruh pegawai dan pensiunan guna terus mendukung produktivitas. Melalui kerja sama dengan Holding BUMN Farmasi ini, kami berharap pelayanan kesehatan terbaik bagi pegawai dan pensiunan PLN,” ujar Darmawan.</p><p>Darmawan juga berharap bahwa kerja sama ini dapat terjalin dalam jangka panjang dan dapat memberikan kesejahteraan bagi kedua pihak. Hal ini karena bisnis usaha PLN yang terus berkembang di sektor kelistrikan membutuhkan dukungan jaminan kesehatan yang prima bagi para pegawainya.</p><p>“Saya melihat sendiri bagaimana perusahaan yang berkontrak dengan PLN itu mampu berkembang karena ada suatu rutinitas dari suatu revenue dan itu bisa dikelola baik untuk mengekspansi program mereka dan bisnis mereka,” ucap Darmawan</p><p>Darmawan juga menganggap kolaborasi bersama Biofarma ini penting. Hal ini mengingat Biofarma Group seperti halnya dengan PLN tengah menjalankan proses transformasi kualitas pelayanan kepada para pelanggan. Untuk itu, Darmawan mengapresiasi dan menyebut kerja sama ini sebagai misi yang mulia untuk meningkatkan kualitas kesehatan bagi pegawai dan Pensiunan PLN.</p><p>Direktur Utama Holding BUMN Farmasi Honesti Basyir dalam sambutannya menyampaikan rasa bangga dapat bersinergi antar BUMN dan merasa yakin dapat mengoptimalkan seluruh potensi kerja sama Holding BUMN Farmasi saat ini.</p><p>“Kami bangga dapat mengoptimalkan kolaborasi dan sinergi antar BUMN, bersama PLN kami yakin dapat mengoptimalkan seluruh potensi Kerjasama Holding BUMN Farmasi yang saat ini sedang bertransformasi menjadi ekosistem <i>health care</i> yang terintegrasi. Kami berharap dapat mengoptimalkan pelayanan kesehatan kepada publik, salah satunya kerja sama pelayanan kesehatan dengan PLN,” ucap Honesti.</p><p>Honesti mengatakan bahwa Kimia Farma sebagai bagian dari Bio Farma Group senantiasa berkomitmen meningkatkan kualitas pelayanan terhadap pelanggan. Salah satu lini layanan andalan adalah Kimia Farma Laboratorium dan Klinik yang akan memberikan lebih banyak layanan yang berfokus pada <i>customer experience</i> dan <i>customer journey</i> selama pelanggan berada di Kimia Farma Laboratorium &amp; Klinik. Hal ini bentuk adaptasi <i>business model</i> Laboratorium Medis dan Klinik yang menjadi best practice di industri kesehatan saat ini. Kimia Farma saat ini mengelola lebih dari 400 titik layanan Kimia Farma Laboratorium &amp; Klinik, serta lebih dari 1.200 titik layanan Kimia Farma Apotek yang tersebar di seluruh Indonesia.</p><p>Honesti juga mengucapkan rasa terima kasih atas kesempatan dapat bekerja sama dengan PLN dan Biofarma Group akan menjaga komitmen dalam memenuhi ekspektasi yang diharapkan oleh PLN.</p><p>“Kami ucapkan terima kasih atas kesempatan yang telah diberikan, dalam pelaksanaannya tidak hanya Kimia Farma yang terlibat, namun kami dari Holding, Biofarma Group berkomitmen untuk mendukung implementasi program kerjasama ini. Kami berkomitmen penuh untuk memenuhi ekspektasi dari PLN,” pungkasnya.</p><p>Kolaborasi Biofarma Group dan PLN ini juga sejalan dengan upaya pemerintah Indonesia dalam menyehatkan bangsa. Untuk itu, Biofarma Group memainkan peran penting dalam menciptakan akselerasi pelayanan Kesehatan di Indonesia dengan inisiatif strategi integrasi layanan kesehatan yang <i>end to end</i> di seluruh wilayah Indonesia melalui Kimia Farma dan entitas Bio Farma Group lainnya.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat &amp; TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p><p>R Rifa Herdian<br>Corporate Secretary PT Bio Farma (Persero)<br>Email: rifaherdian@biofarma.co.id<br>Telepon: +62 812-5428-844</p>', '2023-06-15 11:58:12', '2023-06-15 11:58:12', 1),
(11, '2023-05-21', 'Kunjungan Bisnis ke China, PLN Teken Kerjasama Pengembangan EBT dengan Perusahaan EPC di Beijing', '<p>PT PLN (Persero) kembali melakukan kesepakatan bisnis untuk pengembangan Energi Baru Terbarukan (EBT) di Indonesia. Dalam kunjungan bisnis ke China, Direktur Utama PLN, Darmawan Prasodjo melakukan site visit ke perusahaan konstruksi (<i>Engineering, Procurement, Construction</i>/<i>EPC</i>) China Communications Construction Dredging Co., Ltd (CCCC) di Beijing, sekaligus untuk menyepakati kerja sama pengembangan transisi energi di Indonesia. Kesepakatan yang ditandatangani pada Minggu (21/5) ini ditujukan untuk mempercepat pembangunan pembangkit EBT di Indonesia.</p><p>Direktur Utama PLN, Darmawan Prasodjo menjelaskan saat ini perusahaannya sedang mempercepat pembangunan pembangkit EBT, seperti Pembangkit Listrik Tenaga Air (PLTA), Pembangkit Listrik Tenaga Surya (PLTS), Pembangkit Listrik Tenaga Bayu (PLTB) dan Pembangkit Listrik <i>Pumped Storage</i> di Indonesia. Dengan menggandeng CCCC, yang merupakan perusahaan konstruksi terbesar di China diharapkan bisa mempercepat proses transisi energi dari energi fosil menuju EBT guna mencapai target <i>net zero emission</i> (NZE) pada tahun 2060.</p><p>“Kerja sama yang telah terbangun antara PLN dan CCCC diharapkan bisa mempercepat pembangunan pembangkit EBT. Dengan demikian, Indonesia akan semakin mempercepat proses transisi energi,” ujar Darmawan.</p><p>Selain kerja sama yang telah disebutkan di awal, dengan segudang pengalaman yang dimiliki oleh CCCC, Darmawan menambahkan, PLN bisa menyerap ilmu dari perusahaan tersebut serta berdiskusi hingga berkolaborasi dalam pembangunan infrastruktur EBT, <i>Liquid Natural Gas</i> (LNG) dan terminal untuk gasifikasi .</p><p>CCCC sendiri merupakan perusahaan yang telah terlibat dalam banyak proyek besar di Tiongkok dan luar negeri. Beberapa proyek terbesarnya termasuk pembangunan jembatan Teluk Hangzhou, pelabuhan terbesar di dunia yang berlokasi di Shanghai, serta pembangunan Bendungan Tiga Ngarai di Tiongkok.</p><p>“Kesepakatan kerja sama ini dapat meningkatkan kepercayaan investor. melalui kerja sama yang solid antara PLN dengan CCCC juga diharapkan dapat mempererat hubungan ekonomi antara Tiongkok dan Indonesia,” tutup Darmawan.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat &amp; TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-15 11:59:03', '2023-06-15 11:59:03', 1),
(12, '2023-05-23', 'Buktikan Komitmen Bangun Energi Hijau, PLN Raih Predikat Green Ratings di Sektor Energi dan Pertambangan Pada Green Economic Forum 2023', '<p>PT PLN (Persero) mendapatkan predikat <i>Green Ratings</i> terbaik di Indonesia pada sektor energi dan pertambangan atas upaya perseroan dalam melakukan transisi energi. PLN dinilai sebagai perusahaan yang memiliki perhatian lebih di atas rata-rata industri terkait praktik bisnis yang ramah lingkungan dan berkelanjutan. Predikat ini diberikan oleh CNBC Indonesia Research kepada PLN pada acara <i>Green Economic</i> Forum 2023, Senin (22/5) di Jakarta.</p><p>Kepala Staf Kepresidenan (KSP) Moeldoko dalam sambutannya mengatakan, pertumbuhan ekonomi suatu negara sangat ditentukan oleh komitmen negara menuju <i>Green Economic</i>. Menurut Moeldoko, Indonesia di bawah kepemimpinan Presiden Joko Widodo Indonesia telah berkomitmen kuat mewujudkan Green Economic.</p><p>“Transformasi menuju <i>Green Economic</i> telah dilakukan dan dijalankan secara nyata. Dalam rangka menuju <i>Net Zero Emission</i> pada tahun 2060 Indonesia sudah sangat komit untuk menghadapi perubahan iklim dunia dan mengurangi emisi karbon,” kata Moeldoko.</p><p>Karena itu, Moeldoko mengajak seluruh pihak baik dari unsur pemerintah, swasta hingga masyarakat turut mendukung upaya mewujudkan <i>Green Economic</i> di Indonesia.</p><p>“Kita sudah menuju ke sana, maka tugas kita semuanya adalah bagaimana memberikan dukungan yang semaksimal mungkin agar kebijakan tentang <i>Green Economy</i> betul-betul mendapat dukungan sepenuhnya dari kita semuanya, dari masyarakat Indonesia,” ujar Moeldoko.</p><p>Direktur Utama PLN, Darmawan Prasodjo menjelaskan dalam mempercepat pencapaian target <i>Net Zero Emission</i> (NZE) pada tahun 2060, PLN telah melakukan banyak upaya untuk bisa mengurangi emisi karbon. PLN telah mengurangi pembangunan Pembangkit Listrik Tenaga Uap (PLTU) yang sebelumnya telah direncanakan dalam Rencana Usaha Penyediaan Tenaga Listrik (RUPTL) 2019-2028 sebesar 13,3 Gigawatt (GW) dan akan mengembangkan pembangkit EBT hingga 51,6 persen dari total penambahan pembangkit sesuai RUPTL 2021-2030.</p><p>“Langkah-langkah ini dilakukan PLN untuk bisa mengurangi emisi dari sektor pembangkitan,” ujar Darmawan.</p><p>Secara rinci, PLN akan membangun 10,4 GW Pembangkit Listrik Tenaga Air (PLTA), 3,4 GW pembangkit listrik tenaga panas bumi (PLTP) dan 4,7 GW pembangkit listrik tenaga surya (PLTS).</p><p>Darmawan menambahkan dalam upaya pengurangan emisi, PLN telah melakukan banyak langkah advance seperti menggantikan 1,1 gigawatt (GW) pembangkit listrik tenaga uap (PLTU) dengan energi terbarukan dan 800 megawatt (MW) dengan gas alam. PLN juga melakukan <i>co-firing</i> atau pencampuran batu bara dengan biomassa pada 36 PLTU, yang akan terus bertambah menjadi 52 PLTU. Tidak hanya itu, PLN juga melakukan dedieselisasi pembangkit listrik tenaga diesel (PLTD) sebanyak 1 GW.</p><p>“Kami juga sudah melakukan uji coba perdagangan karbon pertama di 26 pembangkit listrik PLN. Selain itu juga mengaktifkan konsumsi energi terbarukan melalui layanan energi hijau atau <i>Renewable Energy Ceritificate</i> (REC),” tambah Darmawan.</p><p>Darmawan juga menjelaskan bahwa transisi energi ini tidak bisa dilakukan oleh PLN sendiri, namun juga membutuhkan kolaborasi banyak pihak.</p><p>“Ini membutuhkan investasi yang tidak sedikit dan membutuhkan kolaborasi bersama dengan global. Sebab, upaya pengurangan emisi yang kami lakukan ini berdampak langsung pada pengurangan emisi di Jepang, Eropa bahkan Amerika,” pungkas Darmawan.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat dan TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-15 12:01:20', '2023-06-15 12:01:20', 1),
(13, '2023-05-24', 'Kembangkan Sistem Smart Grid, PLN Timba Ilmu Hingga ke Negeri China', '<p>PT PLN (Persero) melakukan studi lapangan ke proyek <i>Smart Grid</i> dan <i>High Voltage Direct Current</i> (HVDC) di Zhangbei, China, dalam rangka penjajakan pengembangan sistem <i>smart grid</i> terintegrasi di tanah air. Studi ini diharapkan menjadi langkah awal PLN membangun sistem interkoneksi antarpulau untuk pembangkit energi baru terbarukan (EBT) dalam skala besar.</p><p>Direktur Utama PLN Darmawan Prasodjo memaparkan untuk membangun sistem interkoneksi antarpulau yang andal, Indonesia membutuhkan digitalisasi jaringan listrik dan pembangunan <i>smart grid</i>. Melalui <i>benchmarking</i> ini PLN ingin melihat secara langsung operasionalisasi sistem<i> smart grid</i> yang terintegrasi dengan pembangkit angin, panel surya, <i>battery storage</i>, serta sistem HVDC dalam skala besar.</p><p>“PLN mengambil langkah agresif untuk pengembangan jaringan <i>smart grid</i> di tanah air. Dari studi ini harapannya PLN dapat segera mengaplikasikan teknologi <i>smart grid</i> agar lebih optimal dalam menghadapi dinamika beban listrik dari sumber EBT yang beragam,” ujar Darmawan.</p><p>Lebih khusus Darmawan menekankan pentingnya pengembangan teknologi HVDC yang dapat menghubungkan berbagai sumber EBT dan tersebar jauh dari pusat demand listrik. PLN menargetkan pengembangan teknologi ini dapat menghubungkan berbagai sumber EBT dari banyak pulau bisa disalurkan dengan stabil dengan losses yang minimum.</p><p>“Pengembangan teknologi HVDC adalah salah satu kunci utama transisi energi di Indonesia. Karena kita memiliki banyak sekali potensi EBT yang tersebar di banyak tempat. Dengan teknologi ini, kendala tersebut bisa diatasi,” tegas Darmawan.</p><p>Proyek <i>Smart Grid</i> dan High Voltage Direct Current di Zhangbei memiliki pembangkit angin berdaya 450 megawatt (MW), panel surya berdaya 100 MW dan dilengkapi sistem penyimpanan baterai sebesar 20 MW yang terdiri dari baterai tipe Lithium, Flow, Sodium-Sulphur, Lead-Acid, Supercapacitor, and Compression of Liquid air. Sedangkan total kapasitasnya sebesar 2×3.000 dan 2×1.500 MW.</p><p>PLN melakukan kunjungan kerja ke China untuk menjajaki peluang kerja sama dengan perusahaan teknologi di China. Langkah ini juga sekaligus untuk mempercepat pengembangan EBT di Indonesia, memperkuat jaringan transmisi sistem kelistrikan serta mengakselerasi program transisi energi.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat &amp; TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-15 12:04:14', '2023-06-15 12:04:14', 1),
(14, '2023-05-24', 'Tagihan Listrik Belum Keluar? Yuk Cek Perkiraan Lewat Fitur Catat Meter Mandiri PLN Mobile', '<p>PT PLN (Persero) memberi kemudahan bagi pelanggan pascabayar untuk mengecek perkiraan tagihan pemakaian listrik setiap bulan. Melalui fitur Catat Meter secara mandiri yang tersedia di aplikasi PLN Mobile, pelanggan dapat mengetahui perkiraan pemakaian listrik setiap bulannya, sebelum tagihan resmi keluar.</p><p>“Dengan fitur ini pelanggan dapat mengetahui perkiraan tagihan listrik dan mengontrol sendiri pemakaian listrik bulanan. Pencatatan meter mandiri dilakukan antara tanggal 23 sampai 27 setiap bulannya,” kata Executive Vice President Komunikasi Korporat dan TJSL PLN Gregorius Adi Trianto.</p><p>Gregorius mengatakan, pelanggan juga tidak perlu khawatir kesulitan melakukan pencatatan meter mandiri melalui fitur tersebut. Karena, langkah-langkah membaca meter mandiri melalui aplikasi PLN Mobile sangat mudah, berikut tahapannya:</p><p>1. Buka aplikasi PLN Mobile<br>2. Pilih menu Catat Meter<br>3. Pilih mulai swacam &amp; foto angka stand meter yang ada di kWh meter<br>4. Pilih ID Pelanggan<br>5. Masukan angka stand meter<br>6. Kirim</p><p>Gregorius melanjutkan, setelah pelanggan melakukan langkah di atas, maka estimasi biaya tagihan rekening listrik juga akan muncul. Kemudian, tagihan listrik akan keluar setiap awal bulan berikutnya. Pembayaran listrik pun bisa dilakukan dengan mudah melalui Aplikasi PLN Mobile.</p><p>Selain itu, layanan Catat Meter Mandiri di PLN Mobile ini sudah mengikuti perhitungan yang didasarkan pada 40 jam nyala, baik tarif blok dan rekening minimum sesuai dengan Peraturan Menteri ESDM Nomor 28 Tahun 2016.</p><p>“Dengan melakukan catat meter mandiri, privasi pelanggan lebih terjaga, apalagi beberapa kWh meter lokasinya ada di dalam garasi rumah,” ujar Gregorius.</p><p>Gregorius berharap, hadirnya berbagai fitur PLN Mobile dapat memudahkan pelanggan bisa mengakses seluruh layanan tanpa perlu lagi ke kantor PLN. Mulai dari melakukan transaksi kelistrikan, seperti pasang baru, tambah daya, bayar tagihan, sampai baca meter mandiri.</p><p>“Pelanggan PLN yang belum memiliki aplikasi PLN Mobile bisa mengunduhnya di App Store maupun Play Store secara gratis,” kata Gregorius.</p><p><strong>Narahubung</strong><br>Grahita Muhammad<br>Vice President Komunikasi Korporat PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-16 07:11:01', '2023-06-16 07:11:01', 1);
INSERT INTO `kontens` (`id`, `tanggal_berita`, `judul_berita`, `isi_berita`, `created_at`, `updated_at`, `created_by`) VALUES
(15, '2023-05-27', 'Tak Hanya Kurangi Emisi, Kendaraan Listrik Dorong Pertumbuhan Ekonomi UMKM', '<p>Menggunakan kendaraan listrik ternyata tak hanya mampu mengurangi emisi karbon karena ramah lingkungan. Menjamurnya kendaraan listrik di Indonesia juga telah menjadi ladang bisnis baru bagi para pelaku Usaha Mikro Kecil Menengah (UMKM).</p><p>Kesadaran bahwa ekosistem kendaraan listrik merupakan upaya menjaga lingkungan dan merupakan ceruk bisnis masa depan dirasakan langsung oleh pemilik Warung Ayam Goreng Gringging Lombok di Surabaya. Steven, pemilik warung ayam ini memasang Stasiun Pengisian Kendaraan Listrik Umum (SPKLU) di warungnya sejak April 2023 lalu.</p><p>“Ini bisnis masa depan, di satu sisi, saya mendukung program pemerintah soal insentif kendaraan listrik ini demi lingkungan yang lebih baik,” ujar Steven.</p><p>Sejak memasang SPKLU di warungnya, sudah ada 87 transaksi kendaraan listrik yang mengisi daya di SPKLU nya. Apalagi, warungnya berada di jalur strategis jalan utama dari Solo hingga Banyuwangi.</p><p>“Hasil dari SPKLU tentunya menjadi tambahan pendapatan baru bagi saya, ini peluang bisnis yang sangat prospektif,” imbuh Steven.</p><p>Direktur Utama PT PLN (Persero) Darmawan Prasodjo menjelaskan bahwa hal tersebut membuktikan ekosistem kendaraan listrik di Indonesia sudah semakin terbentuk dan telah sampai kepada masyarakat luas. Jika sebelumnya franchise SPKLU menarik minat pengusaha mall, perkantoran, saat ini warung makanpun ingin berkontribusi terhadap pengurangan emisi.</p><p>Beralih ke kendaraan listrik menjadi pilihan strategis, mengingat sektor transportasi menjadi salah satu penyumbang utama emisi karbon di Indonesia.</p><p>“Sebagai gambaran, 1 liter bahan bakar minyak (BBM) setara dengan 1,5 kilowatt hour (kWh) listrik. Emisi karbon 1 liter BBM setara dengan 2,4 kilogram (kg) CO2e, sedangkan 1,5 kWh listrik emisinya setara 1,5 kg CO2e,” jelas Darmawan.</p><p>Apalagi kata Darmawan, listrik yang disediakan untuk mengisi daya kendaraan juga akan semakin bersih, menyusul mulai dibangunnya pembangkit yang berbasis Energi Baru Terbarukan (EBT).</p><p>“Artinya, pada kondisi saat ini pun, menggunakan kendaraan listrik sudah mampu mengurangi emisi lebih dari 35 persen. Seiring dengan pembangkit PLN yang menuju ke EBT, maka ke depan kendaraan listrik emisinya akan nol,” jelas Darmawan.</p><p>Darmawan menekankan bahwa selain ramah lingkungan, keunggulan kendaraan listrik adalah lebih hemat, baik dari sisi biaya operasional maupun pemeliharaan. Sebagai gambaran, mobil dengan BBM dengan jarak tempuh 10 kilometer (km) menghabiskan 1 liter BBM, sedangkan mobil listrik dengan jarak sama menghabiskan 1,5 kWh.</p><p>“Maka, dengan asumsi tarif listrik sebesar Rp 1.699,53 per kWh, hanya diperlukan biaya sekitar Rp 2.500 untuk mobil listrik dan sekitar Rp 13 ribu untuk mobil BBM dalam menempuh jarak 10 km. Dengan begitu, biaya operasional menggunakan mobil listrik tidak sampai 20 persen dari biaya menggunakan mobil BBM,” urai Darmawan.</p><p>Selain itu biaya pemeliharaan mobil listrik lebih efisien dibandingkan dengan mobil BBM. Antara lain, mobil listrik tidak menggunakan oli mesin, dimana pada mobil BBM harus dilakukan penggantian setiap 10 ribu kilo meter dengan biaya di atas 1 juta rupiah.</p><p>Darmawan juga menjelaskan bahwa penggunaan kendaraan listrik akan bermanfaat terhadap kedaulatan energi nasional, dimana akan mengurangi impor BBM.</p><p>“Dengan adanya transisi dari BBM ke listrik, maka akan terjadi peralihan energi berbasis impor yang kotor dan mahal, menuju energi berbasis domestik yang murah dan bersih. Sehingga kedaulatan energi nasional semakin kokoh,” tandas Darmawan.</p><p>Terkait infrastruktur pengisian daya, masyarakat tidak perlu khawatir. PLN saat ini telah menyediakan 616 unit SPKLU yang tersebar pada 237 lokasi untuk pengendara&nbsp;kendaraan listrik di tanah air.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat &amp; TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-16 07:11:44', '2023-06-16 07:11:44', 1),
(16, '2023-05-28', 'PLN Siap Suplai Listrik Andal Balapan Motocross Grand Prix Indonesia di NTB', '<p>PT PLN (Persero) siap memasok listrik andal gelaran kejuaraan dunia balap <i>motocross</i> atau Motocross Grand Prix (MXGP) Indonesia tahun 2023 yang akan digelar di Nusa Tenggara Barat (NTB). Dengan layanan listrik tanpa kedip atau <i>zero down time</i>, gelaran balapan motor bergengsi dunia tersebut rencananya akan digelar dua seri pada 23 hingga 25 Juni 2023 di Sirkuit MXGP Samota Sumbawa dan di Sirkuit MXGP Lombok pada 1 hingga 2 Juli 2023.</p><p>General Manager PLN Unit Induk Wilayah NTB Sudjarwo memastikan komitmen PLN menyediakan pasokan listrik yang stabil dan andal di area lintasan serta lokasi pendukung lainnya selama gelaran berlangsung.</p><p>“Kami siap menyukseskan gelaran MXGP yang digelar di Indonesia dengan listrik berkualitas tanpa kedip (<i>zero down time</i>) selama <i>event</i> balapan berlangsung. Karena kesuksesan MXGP ini akan menjadi kebanggaan bagi seluruh rakyat Indonesia. Kami berkomitmen menyediakan listrik yang optimal dan andal, mendukung dua seri MXGP Indonesia dapat terlaksana dengan sukses,” kata Sudjarwo.</p><p>Sudjarwo memaparkan, PLN juga melaksanakan langkah strategis guna memastikan pasokan listrik yang stabil dan andal di area lintasan serta lokasi pendukung balapan. Di antaranya dengan melakukan pemeliharaan rutin, peningkatan infrastruktur guna mengatasi potensi gangguan listrik yang dapat menghambat jalannya <i>event</i> MXGP. Termasuk penguatan sistem jaringan listrik, pemeliharaan Gardu Hubung (GH), hingga memastikan material pendukung telah terpasang.</p><p>“Menjelang pelaksanaan yang kurang dari dua bulan ini, kami telah melakukan berbagai pekerjaan untuk menunjang optimalisasi ketersediaan pasokan listrik,” ujar Sudjarwo.</p><p>Selain itu, kata dia, PLN juga bersinergi dengan berbagai pihak mulai dari <i>event</i> <i>organizer</i>, keamanan, pemerintah daerah setempat dalam upaya mengamankan pasokan listrik yang andal pada MXGP. Dia juga memastikan tim teknis yang terlatih dan berpengalaman telah ditugaskan untuk menangani semua aspek kelistrikan pada event tersebut.</p><p>Sudjarwo pun optimistis, meski persiapan hanya kurang lebih dua bulan, PLN mampu menghadirkan pasokan listrik yang andal selama gelaran berlangsung. Sehingga, dapat memberikan kontribusi nyata dalam menciptakan pengalaman yang tak terlupakan bagi para penggemar balap <i>motocross</i> dengan menghadirkan listrik yang andal dan aman.</p><p>“Dengan pengalaman kami memberikan dukungan listrik di <i>event</i> MXGP tahun sebelumnya, PLN siap untuk menyukseskan <i>event</i> MXGP seri ke-2 di Provinsi NTB ini. Kami juga mohon doa dan dukungan dari seluruh stakeholder dan masyarakat, agar PLN mampu memberikan pelayanan yang terbaik untuk Nusa Tenggara Barat,” tutup Sudjarwo.</p><p><strong>Narahubung</strong><br>Grahita Muhammad<br>Vice President Komunikasi Korporat PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-16 07:12:26', '2023-06-16 07:12:26', 1),
(17, '2023-05-30', 'PLN Rampungkan Transmisi Listrik 150 kV Surabaya Selatan-Kalisari, TKDN Capai 74,38 Persen', '<p>PT PLN (Persero) meningkatkan infrastruktur jaringan listrik di Surabaya untuk mendorong pemulihan dan pertumbuhan ekonomi di Jawa Timur. Hal ini ditandai dengan selesainya pembangunan Saluran Udara Tegangan Tinggi (SUTT) 150 kilo volt (kV) wilayah Surabaya Selatan-Kalisari dengan Tingkat Komponen Dalam Negeri (TKDN) sebesar 74,38 persen.</p><p>Bersamaan rampungnya SUTT Surabaya Selatan-Kalisari ini, PLN juga menyelesaikan pembangunan Gardu Induk (GI) 150 kV Kalisari Bay Couple dan Bay Line Surabaya Selatan 1 dan 2 serta Gardu Induk 150 KV Surabaya Selatan Bay Line Kalisari 1 dan 2.</p><p>Direktur Utama PLN Darmawan Prasodjo mengatakan, pembangunan infrastruktur kelistrikan akan meningkatkan produktivitas masyarakat dan juga mendorong industri sehingga turut mendorong roda perekonomian di daerah tersebut.</p><p>“Pembangunan infrastruktur kelistrikan yang diselesaikan PLN di daerah ini sangatlah penting. Khususnya sebagai pendorong pemulihan ekonomi masyarakat yang sebelumnya terdampak pandemi Covid-19. PLN akan terus meningkatkan keandalan listrik demi memacu geliat perekonomian daerah,” ujar Darmawan.</p><p>Selain itu, Darmawan juga memastikan dalam setiap pengerjaan infrastruktur, PLN senantiasa mengutamakan produk industri dalam negeri. Hal ini selain bentuk dukungan ke pemerintah dalam mengurangi ketergantungan pada produk impor, juga untuk mendukung terciptanya kesempatan kerja dan penghematan devisa negara.</p><p>“Penggunaan TKDN akan terus kami tingkatkan di proyek-proyek PLN lainnya untuk mendukung peningkatan daya saing industri nasional sekaligus menyerap lebih banyak tenaga kerja dalam negeri,” kata Darmawan.</p><p>Direktur Manajemen Proyek dan Energi Baru Terbarukan PLN Wiluyo Kusdwiharto optimistis jaringan kelistrikan dengan panjang lintasan 10,972 kilometer sirkuit (kms) yang terdiri dari 32 tower dan 2 sirkit tersebut akan turut mendorong pertumbuhan perekonomian serta meningkatkan keandalan sistem kelistrikan di Jawa Timur khususnya di Surabaya.</p><p>Wiluyo menyampaikan, pada Triwulan I tahun 2023 pertumbuhan perekonomian di Jawa Timur tumbuh sebesar 4,95 persen dibandingkan dengan tahun sebelumnya. Kemudian, setelah kurang lebih 2 tahun pandemi Covid-19 melanda Indonesia, pemulihan ekonomi di Pulau Jawa semakin pesat dengan level pertumbuhan yang berbeda-beda.</p><p>“Keandalan sistem kelistrikan memegang peranan penting dalam mendukung perekonomian masyarakat. Di masa peralihan pandemi menjadi endemi, PLN siap hadir untuk mendukung pertumbuhan ekonomi Jawa Timur,” kata Wiluyo.</p><p>Wiluyo menambahkan, pembangunan seluruh infrastruktur ketenagalistrikan ini berhasil diselesaikan dengan <i>zero accident.</i> Dia juga menyebut, keberhasilan pembangunan SUTT 150 kV ini merupakan wujud nyata atas dedikasi PLN secara penuh dalam melistriki seluruh negeri.</p><p>“Secara konsisten PLN selalu berupaya meningkatkan keandalan kelistrikan di seluruh Indonesia. Kali ini, PLN kembali menunjukkan wujud nyata dedikasinya dengan peningkatan keandalan kelistrikan di Jawa Timur,” tambah Wiluyo.</p><p>General Manager PLN Unit Induk Pembangunan Jawa Bagian Timur dan Bali (UIP JBTB) Anang Yahmadi mengatakan, keberhasilan <i>energize</i> SUTT 150 kV Surabaya Selatan-Kalisari ini tidak lepas dari kerja sama dan dukungan penuh dari pemerintah setempat.</p><p>“Keandalan kelistrikan Jawa Timur meningkat dengan keberhasilan pemberian tegangan di SUTT 150 kV Surabaya Selatan-Kalisari ini. PLN Group dan stakeholder terkait sangat berperan dari awal pelaksanaan pekerjaan, hingga akhirnya dapat dilakukan pemberian tegangan pertama (<i>energize</i>) ini,” ujarnya.</p><p>Dia menjelaskan, proses energize dilaksanakan setelah seluruh rangkaian tahapan tes dan pengujian peralatan (<i>commissioning</i>) berhasil dilalui dan ditandai dengan terbitnya Rekomendasi Laik Bertegangan (RLB).</p><p>“Kami optimistis dengan peningkatan keandalan kelistrikan akan mendukung dunia usaha, khususnya warga yang ada di wilayah subsistem Surabaya Metropolis. Sesuai dengan tujuan PLN memberikan kehidupan yang lebih baik melalui penyediaan kelistrikan, kami yakin <i>energize</i> ini akan memberi dampak positif bagi masyarakat,” ujarnya.</p><p><strong>Narahubung</strong><br>Gregorius Adi Trianto<br>Executive Vice President Komunikasi Korporat &amp; TJSL PLN<br>Tlp. 021 7261122<br>Facs. 021 7227059</p>', '2023-06-16 07:13:22', '2023-06-16 07:13:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2023_05_23_015859_create_kontens_table', 1),
(4, '2023_05_23_034900_create_pengumuman_table', 1),
(5, '2023_05_23_034901_create_foto_table', 1),
(6, '2023_05_31_013255_foreign_key_on_users_table', 1),
(7, '2023_06_26_162753_create_kegiatan_table', 2),
(8, '2023_06_26_170533_create_altertable_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_pengumuman` date NOT NULL,
  `isi_pengumuman` text NOT NULL,
  `detail_pengumuman` varchar(255) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `tanggal_pengumuman`, `isi_pengumuman`, `detail_pengumuman`, `gambar`, `created_at`, `updated_at`, `created_by`) VALUES
(1, '2023-06-01', 'Hari Buruh Nasional', 'Memperingati Hari Buruh Nasional maka kegiatan di kantor diliburkan', 'foto-1687190229.jpg', '2023-06-19 08:57:09', '2023-06-19 08:57:09', 1),
(2, '2023-05-06', 'Hari Raya Waisak', 'Memperingati Hari Buruh Nasional maka kegiatan di kantor diliburkan', 'foto-1687245174.jpg', '2023-06-20 00:12:54', '2023-06-20 00:12:54', 1),
(4, '2023-05-08', 'Rapat Kegiatan Divisi K3L', 'asd', NULL, '2023-06-20 00:30:48', '2023-06-20 00:30:48', 1),
(5, '2023-06-18', 'Kenaikan Isa Al-Masih', 'Memperingati Hari Kenaikan Isa Al-Masih maka kegiatan di kantor diliburkan', 'foto-1687246868.jpg', '2023-06-20 00:41:08', '2023-06-20 00:41:08', 1),
(6, '2023-05-25', 'Rapat Kegiatan Divisi Perencanaan', '<p>Perihal : Membahas perencanaan pembuatan stasiun pengisian daya listrik kendaraan</p><p>Hari/Tanggal : Jum\'at, 26 Mei 2023</p><p>Jam : 13:30-selesai</p><p>Tempat : Ruang Rapat Lantai 1</p>', NULL, '2023-06-20 00:51:13', '2023-06-20 01:08:03', 1),
(7, '2023-05-29', 'Rapat Kegiatan Divisi Keuangan', '<p>Perihal : Membahas penutupan buku akhir bulan</p><p>Hari/Tanggal : Rabu, 31 Mei 2023</p><p>Jam : 09:00-selesai</p><p>Tempat : Ruang Rapat Lantai 1</p>', NULL, '2023-06-20 00:56:40', '2023-06-20 01:11:34', 1),
(10, '2023-06-22', 'Mahasiswa mdp melakukan presentasi', '<p>Di ruang 404</p>', NULL, '2023-06-21 23:35:32', '2023-06-21 23:35:32', 2),
(11, '2023-06-22', 'Minggu tenang', '<p>untuk mahsisswa semester 2 dan 44</p>', 'foto-1687415772.jpg', '2023-06-21 23:36:12', '2023-06-21 23:36:12', 2);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$1D0VgUoRyNJE/NWDmNA8cu.nldZLU6whv2fLGMLKwntK7Vk4CPkqC', '2023-06-15 11:46:16', '2023-06-15 11:46:16'),
(2, 'Eka Freti Anavilam', 'eka.fretinavilam@gmail.com', '$2y$10$1/u01n6svJDFWwuTAtx1k.bmpZHU0i8eN4I3aZ.L8bckmMgjCP9uO', '2023-06-15 11:46:16', '2023-06-15 11:46:16'),
(3, 'Nia Widianingrum', 'niawidianingrum@gmail.com', '$2y$10$ayiv4r9ObpPtTKfIzYfdqeDUzDm6n60OpeagQMojXu8/8P9/oiDg2', '2023-06-19 11:23:17', '2023-06-19 11:23:17'),
(4, 'Dery Afriadi', 'deryafriadi@gmail.com', '$2y$10$KSfcKVtdrilpJwUqRYXz4epO18n6dMes6dRAUKtqjOZXvjLaaaRTS', '2023-06-19 11:24:08', '2023-06-19 11:24:08'),
(5, 'Erny Anggraini Lukman', 'anggraini@gmail.com', '$2y$10$MJ9Qb8F5xhmSqOXUXNQgmejFp28A2aZu9xMb/CxoqgcQj8DJEVevC', '2023-06-19 11:25:18', '2023-06-19 11:25:18'),
(8, 'Kiki Kahfi Abdul Fatah', 'kikikahfi@gmail.com', '$2y$10$RFSdluzC0u8CANfWz/ds6OpveLoY5BseUIV5Zwtm0zovWMFKESEca', '2023-06-19 11:30:45', '2023-06-19 11:30:45'),
(9, 'Fernandi Indi Nizar G', 'nizar@gmail.com', '$2y$10$e.XoJX4SR9xJnYHUMPS8K.wELGHatRrxXa82WBDLzk8wy/E3yWPMu', '2023-06-21 00:39:31', '2023-06-21 00:39:31'),
(10, 'fernandi Nizat', 'fernandi@gmail.com', '$2y$10$CLcfOZzSFm6dQX.ynqGtOu.atOCS7iPINAzDbf/xW4ZQgDsbZd9lq', '2023-06-21 08:19:11', '2023-06-21 08:19:11'),
(11, 'Rizky Kurniawan', 'rizky@gmail.com', '$2y$10$dNsKHpv.D0WR2GDwCSU6Du9AOnM2rU/FsQg1OjKt50VWJ30XkQNZC', '2023-06-21 23:37:37', '2023-06-21 23:37:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foto_konten_id_foreign` (`konten_id`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kegiatan_created_by_foreign` (`created_by`);

--
-- Indexes for table `kontens`
--
ALTER TABLE `kontens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kontens_created_by_foreign` (`created_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengumuman_created_by_foreign` (`created_by`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `kontens`
--
ALTER TABLE `kontens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_konten_id_foreign` FOREIGN KEY (`konten_id`) REFERENCES `kontens` (`id`);

--
-- Constraints for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `kegiatan_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `kontens`
--
ALTER TABLE `kontens`
  ADD CONSTRAINT `kontens_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD CONSTRAINT `pengumuman_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
