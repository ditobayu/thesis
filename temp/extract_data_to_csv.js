const fs = require('fs');
const path = require('path');
const csvWriter = require('csv-writer').createObjectCsvWriter;

const testFolder = path.join(__dirname, 'test');
const outputCsv = path.join(__dirname, 'rekap_data.csv');

const csv = csvWriter({
    path: outputCsv,
    header: [
        { id: 'folder', title: 'Folder' },
        { id: 'waktuGenerasi', title: 'Waktu Generasi' },
        { id: 'tailwindCss', title: 'Tailwind CSS' },
        { id: 'bootstrap', title: 'Bootstrap' },
        { id: 'ukuranFile', title: 'Ukuran File' },
        { id: 'fcp', title: 'Waktu Pemuatan Awal Konten (FCP)' },
        { id: 'penggunaanMemori', title: 'Penggunaan Memori' },
        { id: 'waktuPemuatanHalaman', title: 'Waktu Pemuatan Halaman' },
        { id: 'ssim', title: 'Structural Similarity Index' },
        { id: 'linkSource', title: 'Link Source' },
    ]
});

const extractData = (content) => {
    const data = {};
    const lines = content.split('\n');

    lines.forEach(line => {
        if (line.startsWith('Waktu Generasi:')) {
            data.waktuGenerasi = line.replace('Waktu Generasi:', '').trim();
        } else if (line.startsWith('Tailwind CSS:')) {
            data.tailwindCss = line.replace('Tailwind CSS:', '').trim();
        } else if (line.startsWith('Bootstrap:')) {
            data.bootstrap = line.replace('Bootstrap:', '').trim();
        } else if (line.startsWith('Ukuran File:')) {
            data.ukuranFile = line.replace('Ukuran File:', '').trim();
        } else if (line.startsWith('Waktu Pemuatan Awal Konten (FCP):')) {
            data.fcp = line.replace('Waktu Pemuatan Awal Konten (FCP):', '').trim();
        } else if (line.startsWith('Penggunaan Memori:')) {
            data.penggunaanMemori = line.replace('Penggunaan Memori:', '').trim();
        } else if (line.startsWith('Waktu Pemuatan Halaman:')) {
            data.waktuPemuatanHalaman = line.replace('Waktu Pemuatan Halaman:', '').trim();
        } else if (line.startsWith('Structural Similarity Index:')) {
            data.ssim = line.replace('Structural Similarity Index:', '').trim();
        } else if (line.startsWith('Link Source:')) {
            data.linkSource = line.replace('Link Source:', '').trim();
        }
    });

    return data;
};

const processFiles = () => {
    const folders = fs.readdirSync(testFolder);
    const records = [];

    folders.forEach(folder => {
        const dataFile = path.join(testFolder, folder, 'data.md');
        if (fs.existsSync(dataFile)) {
            const content = fs.readFileSync(dataFile, 'utf-8');
            const data = extractData(content);
            records.push({ folder, ...data });
        }
    });

    csv.writeRecords(records)
        .then(() => console.log('CSV file successfully created at', outputCsv))
        .catch(err => console.error('Error writing CSV file:', err));
};

processFiles();