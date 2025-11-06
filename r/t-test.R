# -----------------------------------------------------------------
# LANGKAH 1: MUAT PAKET DAN DATA
# -----------------------------------------------------------------

# Muat paket 'tidyverse' (kita gunakan 'readr' untuk membaca file)
library(tidyverse)

# Tentukan nama file Anda
nama_file <- "ukuran-file.csv"

# Baca data CSV Anda
data <- read_csv(nama_file)

# -----------------------------------------------------------------
# LANGKAH 2: LAKUKAN T-TEST KESELURUHAN
# -----------------------------------------------------------------

# Sintaks: t.test(GrupA, GrupB)
# Secara default, R akan menjalankan "Welch's t-test",
# yang tidak mengharuskan varians kedua grup sama (ini lebih aman).

uji_keseluruhan_t <- t.test(data$`Tailwind CSS`, data$Bootstrap)

# -----------------------------------------------------------------
# LANGKAH 3: TAMPILKAN HASIL
# -----------------------------------------------------------------

cat("\n\n--- HASIL T-TEST (KESELURUHAN) ---\n")
print(uji_keseluruhan_t)