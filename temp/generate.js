const fs = require('fs');
const path = require('path');

// --- PENGATURAN ---
const FOLDER_AWAL = 6;      // Nomor folder pertama yang akan dibuat
const JUMLAH_FOLDER = 25;   // Berapa banyak folder yang ingin dibuat (misal: 10 folder dari 6 sampai 15)
// --------------------

const dataMdContent = `Waktu Generasi: 
Tailwind CSS:


Bootstrap:


Ukuran File: 
Tailwind CSS:


Bootstrap:


Waktu Pemuatan Awal Konten (FCP): 
Tailwind CSS:


Bootstrap:


Penggunaan Memori: 
Tailwind CSS:


Bootstrap:


Waktu Pemuatan Halaman: 
Tailwind CSS:


Bootstrap:


Structural Similarity Index: 
Tailwind CSS:


Bootstrap:


`;

function generateFolders() {
  console.log(`Memulai proses pembuatan folder dari nomor ${FOLDER_AWAL}...`);

  const folderAkhir = FOLDER_AWAL + JUMLAH_FOLDER;

  for (let i = FOLDER_AWAL; i < folderAkhir; i++) {
    const folderName = i.toString();
    const folderPath = path.join(__dirname, folderName);

    try {
      // 1. Buat folder utama (misal: "6", "7", dst.)
      // Opsi { recursive: true } akan mencegah error jika folder sudah ada
      fs.mkdirSync(folderPath, { recursive: true });

      // 2. Buat file-file di dalam folder tersebut
      fs.writeFileSync(path.join(folderPath, 'data.md'), dataMdContent);
      fs.writeFileSync(path.join(folderPath, 'bootstrap.html'), ''); // File kosong
      fs.writeFileSync(path.join(folderPath, 'tailwind.html'), '');  // File kosong

      console.log(`✅ Folder "${folderName}" berhasil dibuat beserta isinya.`);

    } catch (error) {
      console.error(`❌ Gagal membuat folder "${folderName}":`, error);
    }
  }

  console.log('\nProses selesai!');
}

// Jalankan fungsi
generateFolders();