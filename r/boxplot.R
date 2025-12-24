# -----------------------------------------------------------------
# LANGKAH 1: PERSIAPAN
# -----------------------------------------------------------------

# Jika Anda belum memiliki paket 'tidyverse', Anda perlu menginstalnya sekali.
# Hapus tanda # di bawah ini jika Anda perlu menginstalnya.
# install.packages("tidyverse")

# Muat paket yang diperlukan (ggplot2 untuk plotting, readr untuk baca csv, tidyr untuk reshape)
library(tidyverse)

# -----------------------------------------------------------------
# LANGKAH 2: BACA DAN PERSIAPKAN DATA
# -----------------------------------------------------------------

# Tentukan nama file Anda
nama_file <- "ssim2.csv"

# Baca data CSV Anda
# PENTING: Pastikan file CSV ini ada di "Working Directory" RStudio Anda.
# Anda bisa mengatur Working Directory melalui menu:
# Session -> Set Working Directory -> Choose Directory...
# ...dan pilih folder tempat file CSV Anda disimpan.
data <- read_csv(nama_file)

# Lihat beberapa baris pertama untuk memastikan data terbaca
print(head(data))

# -----------------------------------------------------------------
# LANGKAH 3: RESTRUKTUR ULANG DATA (DARI WIDE KE LONG)
# -----------------------------------------------------------------

# Kita ubah data agar kolom 'Tailwind CSS' dan 'Bootstrap' menjadi satu
# kolom 'Framework' dan nilainya di kolom 'Waktu'.
data_long <- data %>%
  pivot_longer(
    cols = c("Tailwind CSS", "Bootstrap"), # Kolom yang ingin digabungkan
    names_to = "Framework",              # Nama kolom baru untuk 'Tailwind CSS' / 'Bootstrap'
    values_to = "Waktu"                  # Nama kolom baru untuk nilai/angkanya
  )

# Lihat hasil reshape data
print(head(data_long))

# -----------------------------------------------------------------
# LANGKAH 4: ATUR URUTAN KATEGORI (FACTOR)
# -----------------------------------------------------------------

# Ini penting agar sumbu X berurutan: Rendah -> Sedang -> Tinggi
data_long$`Tingkat Kompleksitas` <- factor(
  data_long$`Tingkat Kompleksitas`,
  levels = c("Rendah", "Sedang", "Tinggi")
)

# -----------------------------------------------------------------
# LANGKAH 5: BUAT BOXPLOT
# -----------------------------------------------------------------

# Buat plot menggunakan ggplot2
# - x = Tingkat Kompleksitas
# - y = Waktu
# - fill = Framework (untuk membedakan warna boxplot)
plot <- ggplot(data_long, aes(x = `Tingkat Kompleksitas`, y = Waktu, fill = Framework)) +
  
  # Tambahkan geometri boxplot
  # position = "dodge" membuat boxplot Tailwind dan Bootstrap bersebelahan
  geom_boxplot(position = position_dodge(width = 0.8)) +
  
  # Beri judul dan label
  labs(
    title = "",
    subtitle = "",
    x = "Tingkat Kompleksitas",
    y = "SSIM"
  ) +
  
  # (Opsional) Menggunakan tema yang lebih bersih
  theme_minimal()

# -----------------------------------------------------------------
# LANGKAH 6: TAMPILKAN PLOT
# -----------------------------------------------------------------

# Perintah ini akan menampilkan plot di panel "Plots" RStudio Anda
print(plot)

# (Opsional) Jika Anda ingin menyimpannya sebagai file gambar (misal PNG)
# ggsave("hasil_boxplot.png", plot, width = 8, height = 5)