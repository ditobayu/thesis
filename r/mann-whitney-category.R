# -----------------------------------------------------------------
# LANGKAH 1: MUAT PAKET DAN DATA
# -----------------------------------------------------------------

# Muat paket 'tidyverse' (kita gunakan 'readr' untuk membaca file)
library(tidyverse)

# Tentukan nama file Anda
nama_file <- "waktu-generasi.csv"

# Baca data CSV Anda
# PENTING: Pastikan file CSV ada di Working Directory Anda
data <- read_csv(nama_file)

# Lihat data
print("Data Asli:")
print(head(data))

# -----------------------------------------------------------------
# LANGKAH 2: PISAHKAN DATA BERDASARKAN KATEGORI
# -----------------------------------------------------------------

# Kita gunakan fungsi 'subset' dari Base R untuk memfilter data

# 1. Data untuk kategori "Rendah"
data_rendah <- subset(data, `Tingkat Kompleksitas` == "Rendah")

# 2. Data untuk kategori "Sedang"
data_sedang <- subset(data, `Tingkat Kompleksitas` == "Sedang")

# 3. Data untuk kategori "Tinggi"
data_tinggi <- subset(data, `Tingkat Kompleksitas` == "Tinggi")

# Cek salah satu data (opsional)
# print(data_rendah)

# -----------------------------------------------------------------
# LANGKAH 3: LAKUKAN UJI MANN-WHITNEY U (WILCOXON RANK-SUM TEST)
# -----------------------------------------------------------------

# Fungsi di R adalah wilcox.test()
# Sintaks: wilcox.test(GrupA, GrupB)

# Tes 1: Kategori RENDAH
# Membandingkan 'Tailwind CSS' vs 'Bootstrap' HANYA untuk baris 'Rendah'
uji_rendah <- wilcox.test(data_rendah$`Tailwind CSS`, data_rendah$Bootstrap)

# Tes 2: Kategori SEDANG
# Membandingkan 'Tailwind CSS' vs 'Bootstrap' HANYA untuk baris 'Sedang'
uji_sedang <- wilcox.test(data_sedang$`Tailwind CSS`, data_sedang$Bootstrap)

# Tes 3: Kategori TINGGI
# Membandingkan 'Tailwind CSS' vs 'Bootstrap' HANYA untuk baris 'Tinggi'
uji_tinggi <- wilcox.test(data_tinggi$`Tailwind CSS`, data_tinggi$Bootstrap)


# -----------------------------------------------------------------
# LANGKAH 4: TAMPILKAN HASIL UJI
# -----------------------------------------------------------------

# 'print()' akan menampilkan hasil lengkap di Console RStudio

cat("\n\n--- HASIL UJI MANN-WHITNEY U (Kategori: Rendah) ---\n")
print(uji_rendah)

cat("\n\n--- HASIL UJI MANN-WHITNEY U (Kategori: Sedang) ---\n")
print(uji_sedang)

cat("\n\n--- HASIL UJI MANN-WHITNEY U (Kategori: Tinggi) ---\n")
print(uji_tinggi)