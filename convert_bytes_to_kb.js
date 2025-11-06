#!/usr/bin/env node
/**
 * Script untuk mengkonversi data dari bytes ke KB
 */

// Data dalam bytes
// const dataBytes = [
//     2598,
//     2408,
//     1646,
//     2615,
//     3019,
//     3092,
//     2938,
//     3962,
//     3651,
//     1969,
//     3469,
//     6491,
//     3128,
//     4838,
//     2899,
//     2305,
//     5838,
//     5760,
//     3848,
//     4591,
//     5455,
//     3789,
//     4355,
//     5074,
//     4343,
//     3755,
//     4202,
//     6459,
//     5563,
//     6440
// ];
const dataBytes = [
2697,
2070,
1369,
3144,
3049,
1868,
2717,
2479,
3835,
1864,
3440,
3420,
3412,
3618,
3135,
2312,
4961,
5922,
3901,
4680,
4840,
3993,
4104,
4431,
3537,
2260,
3868,
5303,
4584,
5224,
];

// Konversi dari bytes ke KB (1 KB = 1024 bytes)
const dataKB = dataBytes.map(bytes => bytes / 1024);

// Tampilkan hasil
console.log("Data dalam Bytes -> KB:");
console.log("-".repeat(40));
dataBytes.forEach((bytes, index) => {
    const kb = dataKB[index];
    console.log(`${(index + 1).toString().padStart(2)}. ${bytes.toString().padStart(5)} bytes = ${kb.toFixed(2).padStart(7)} KB`);
});

console.log("\n" + "=".repeat(40));
console.log("\nData KB (untuk copy):");
console.log("-".repeat(40));
dataKB.forEach(kb => {
    console.log(kb.toFixed(2));
});

console.log("\n" + "=".repeat(40));
console.log("\nData KB (dalam satu baris, dipisahkan koma):");
console.log("-".repeat(40));
console.log(dataKB.map(kb => kb.toFixed(2)).join(", "));

console.log("\n" + "=".repeat(40));
console.log("\nData KB (sebagai array JavaScript):");
console.log("-".repeat(40));
console.log(JSON.stringify(dataKB.map(kb => parseFloat(kb.toFixed(2))), null, 2));
