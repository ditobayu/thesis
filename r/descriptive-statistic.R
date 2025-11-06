# Install dan muat library yang diperlukan
if (!require(dplyr)) {
  install.packages("dplyr")
}
if (!require(tidyr)) {
  install.packages("tidyr")
}
if (!require(purrr)) {
  install.packages("purrr")
}
library(dplyr)
library(tidyr)
library(purrr)

# 1. Tentukan path dan temukan semua file .csv
path_folder <- "." 
files_list <- list.files(path = path_folder, 
                         pattern = "\\.csv$",
                         full.names = TRUE)

# 2. Baca dan gabungkan semua file
all_data <- files_list %>%
  set_names() %>%
  map_dfr(~ read.csv(.), .id = "Nama_File") %>%
  mutate(Nama_File = basename(Nama_File))

# 3. Ubah ke format "panjang"
data_long <- all_data %>%
  pivot_longer(
    cols = c(Tailwind.CSS, Bootstrap),
    names_to = "Metode",
    values_to = "Waktu"
  )

# 4. Hitung statistik, group by 'Nama_File' DAN 'Metode'
summary_stats <- data_long %>%
  group_by(Nama_File, Metode) %>%
  summarise(
    `Rata-Rata` = mean(Waktu, na.rm = TRUE),
    Median = median(Waktu, na.rm = TRUE),
    `Std. Deviasi` = sd(Waktu, na.rm = TRUE),
    Minimum = min(Waktu, na.rm = TRUE),
    Maksimum = max(Waktu, na.rm = TRUE),
    .groups = 'drop' 
  )

# 5. Lakukan "Pivot" ganda
stats_long <- summary_stats %>%
  pivot_longer(
    cols = c(`Rata-Rata`, Median, `Std. Deviasi`, Minimum, Maksimum),
    names_to = "Statistik",
    values_to = "Nilai"
  )

final_table <- stats_long %>%
  pivot_wider(
    names_from = Metode,
    values_from = Nilai
  )

# 6. Tampilkan SEMUA baris tabel akhir
print("Tabel Statistika Deskriptif Gabungan (per File):")
print(final_table, n = Inf)