# -----------------------------------------------------------------
# LANGKAH 1: MUAT PAKET DAN DATA
# -----------------------------------------------------------------

# Muat paket 'tidyverse' (kita gunakan 'readr' untuk membaca file)
library(tidyverse)

# Tentukan nama file Anda
nama_file <- "ssim2.csv"

# Baca data CSV Anda
# PENTING: Pastikan file CSV ada di Working Directory Anda
data <- read_csv(nama_file)

# Lihat data
print("Data Asli:")
print(head(data))

# -----------------------------------------------------------------
# LANGKAH 2: LAKUKAN UJI MANN-WHITNEY U (WILCOXON RANK-SUM TEST)
# -----------------------------------------------------------------

# Kita langsung bandingkan seluruh kolom "Tailwind CSS"
# dengan seluruh kolom "Bootstrap"

uji_keseluruhan <- wilcox.test(data$`Tailwind CSS`, data$Bootstrap)

# -----------------------------------------------------------------
# LANGKAH 3: TAMPILKAN HASIL UJI
# -----------------------------------------------------------------

cat("\n\n--- HASIL UJI MANN-WHITNEY U (KESELURUHAN) ---\n")
print(uji_keseluruhan)

cat("\nCatatan: Uji ini membandingkan semua data Tailwind (n=30) vs semua data Bootstrap (n=30).\n")