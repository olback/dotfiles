#!/usr/bin/node

// @ts-check

const fs = require('fs');

const codiumProductJsonPath = '/usr/share/vscodium-bin/resources/app/product.json';
const newExtensionsGallery = {
    key: 'extensionsGallery',
    data: {
        serviceUrl: 'https://marketplace.visualstudio.com/_apis/public/gallery',
        itemUrl: 'https://marketplace.visualstudio.com/items'
    }
};

console.log(`Modifying ${codiumProductJsonPath}`);

const fileData = fs.readFileSync(codiumProductJsonPath, 'utf8').toString();
let fileJson = JSON.parse(fileData);
fileJson[newExtensionsGallery.key] = newExtensionsGallery.data;
const newFileData = JSON.stringify(fileJson, null, 4);
fs.writeFileSync(codiumProductJsonPath, newFileData);

console.log('Done')
