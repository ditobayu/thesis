#!/usr/bin/env python3
"""
Script untuk mengkonversi data dari bytes ke KB
"""

# Data dalam bytes
data_bytes = [
    2598,
    2408,
    1646,
    2615,
    3019,
    3092,
    2938,
    3962,
    3651,
    1969,
    3469,
    6491,
    3128,
    4838,
    2899,
    2305,
    5838,
    5760,
    3848,
    4591,
    5455,
    3789,
    4355,
    5074,
    4343,
    3755,
    4202,
    6459,
    5563,
    6440
]

# Konversi dari bytes ke KB (1 KB = 1024 bytes)
data_kb = [bytes_val / 1024 for bytes_val in data_bytes]

# Tampilkan hasil
print("Data dalam Bytes -> KB:")
print("-" * 40)
for i, (bytes_val, kb_val) in enumerate(zip(data_bytes, data_kb), 1):
    print(f"{i:2d}. {bytes_val:5d} bytes = {kb_val:7.2f} KB")

print("\n" + "=" * 40)
print("\nData KB (untuk copy):")
print("-" * 40)
for kb_val in data_kb:
    print(f"{kb_val:.2f}")

print("\n" + "=" * 40)
print("\nData KB (dalam satu baris, dipisahkan koma):")
print("-" * 40)
kb_values_str = ", ".join([f"{kb_val:.2f}" for kb_val in data_kb])
print(kb_values_str)

print("\n" + "=" * 40)
print("\nData KB (sebagai list Python):")
print("-" * 40)
print(data_kb)
