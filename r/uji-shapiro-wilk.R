# 1. Muat data
data <- read.csv("ssim.csv")

# 2. Cek nama kolom (opsional)
# names(data)

# 3. Uji Shapiro-Wilk untuk seluruh data Tailwind CSS
cat("--- Hasil Uji Shapiro-Wilk untuk Tailwind CSS (seluruh data) ---\n")

# Ambil semua data Tailwind CSS (hapus NA)
data_tailwind <- na.omit(data$Tailwind.CSS)

# Cek jumlah data dan lakukan uji
if (length(data_tailwind) >= 3) {
  cat("\nHasil uji Shapiro-Wilk:\n")
  print(shapiro.test(data_tailwind))
} else {
  cat("\nData tidak cukup untuk uji Shapiro-Wilk (minimal 3 nilai).\n")
}

# 4. Uji Shapiro-Wilk untuk seluruh data Bootstrap
cat("\n--- Hasil Uji Shapiro-Wilk untuk Bootstrap (seluruh data) ---\n")

# Ambil semua data Bootstrap (hapus NA)
data_bootstrap <- na.omit(data$Bootstrap)

# Cek jumlah data dan lakukan uji
if (length(data_bootstrap) >= 3) {
  cat("\nHasil uji Shapiro-Wilk:\n")
  print(shapiro.test(data_bootstrap))
} else {
  cat("\nData tidak cukup untuk uji Shapiro-Wilk (minimal 3 nilai).\n")
}
