# --- Langkah 1: Muat Data ---
# Ganti "nama_file_kamu.csv" dengan nama file CSV kamu
#
# Kita akan skip 2 baris header pertama dan membiarkan R menamainya
# secara otomatis (V1, V2, V3, dst.)
#
# header = FALSE -> Tidak ada baris header
# skip = 2       -> Lewati 2 baris pertama (baris header gabunganmu)
# sep = ","      -> Tentukan pemisah kolom (meskipun default, ini praktik yang baik)
data_mentah <- read.csv("Data Skripsi - Sheet1.csv", 
                        header = FALSE, 
                        skip = 2, 
                        sep = ",")

# --- Langkah 2: Pahami Kolom Kamu ---
# Berdasarkan file yang kamu kirim, ini adalah petanya:
# V3 = Waktu Generasi (Tailwind)
# V4 = Waktu Generasi (Bootstrap)
# V5 = Ukuran File (Tailwind)
# V6 = Ukuran File (Bootstrap)
# V7 = FCP (Tailwind)
# V8 = FCP (Bootstrap)
# V9 = LCP (Tailwind)
# V10 = LCP (Bootstrap)
# V11 = Penggunaan Memori (Tailwind)
# V12 = Penggunaan Memori (Bootstrap)
# V13 = SSIM (Tailwind)
# V14 = SSIM (Bootstrap)

# --- Langkah 3: Bersihkan Data (PENTING) ---
# Kita harus mengubah teks "25,69" menjadi angka 25.69
# Kita lakukan ini untuk semua kolom metrik

# Buat salinan data agar data asli aman
data_bersih <- data_mentah

# Fungsi gsub() akan mengganti koma (",") dengan titik (".")
# Fungsi as.numeric() akan mengubah teks tadi menjadi angka
# Kita terapkan ke semua kolom metrik (V3 sampai V14)

kolom_metrik <- paste0("V", 3:14) # Membuat daftar V3, V4, ..., V14

for (kol in kolom_metrik) {
  data_bersih[[kol]] <- as.numeric(gsub(",", ".", data_bersih[[kol]]))
}

# Cek hasil pembersihan data (opsional)
# str(data_bersih)
# head(data_bersih)

# --- Langkah 4: Lakukan Uji Shapiro-Wilk ---
# Sekarang kita bisa lakukan tes pada data yang sudah bersih

# Contoh 1: Menguji metrik "Waktu Generasi"
uji_waktu_tailwind <- shapiro.test(data_bersih$V3)
uji_waktu_bootstrap <- shapiro.test(data_bersih$V4)

print("--- Hasil Uji Normalitas: Waktu Generasi (Tailwind) ---")
print(uji_waktu_tailwind)

print("--- Hasil Uji Normalitas: Waktu Generasi (Bootstrap) ---")
print(uji_waktu_bootstrap)


# Contoh 2: Menguji metrik "Ukuran File"
uji_file_tailwind <- shapiro.test(data_bersih$V5)
uji_file_bootstrap <- shapiro.test(data_bersih$V6)

print("--- Hasil Uji Normalitas: Ukuran File (Tailwind) ---")
print(uji_file_tailwind)

print("--- Hasil Uji Normalitas: Ukuran File (Bootstrap) ---")
print(uji_file_bootstrap)

# Contoh 3: Menguji metrik "SSIM"
uji_ssim_tailwind <- shapiro.test(data_bersih$V13)
uji_ssim_bootstrap <- shapiro.test(data_bersih$V14)

print("--- Hasil Uji Normalitas: SSIM (Tailwind) ---")
print(uji_ssim_tailwind)

print("--- Hasil Uji Normalitas: SSIM (Bootstrap) ---")
print(uji_ssim_bootstrap)

# ... Lakukan hal yang sama untuk metrik lainnya (V7, V8, V9, dst.) ...
