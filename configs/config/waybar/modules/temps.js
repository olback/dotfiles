#!/usr/bin/env node
const exec = require('child_process').exec;

const CPU_KEY = 'coretemp-isa-0000';
const NVME_KEY = 'nvme-pci-0400';

exec('sensors -j', (_error, stdout, _stderr) => {
    let data = JSON.parse(stdout);
    let lines = [];

    lines.push('  CPU:');
    for (const k in data[CPU_KEY]) {
        let v = data[CPU_KEY][k];
        if (typeof v == 'object') {
            for (const vk in v) {
                if (vk.endsWith('_input') && !k.includes('Package')) {
                    lines.push(`${k}: ${v[vk]}°C`);
                }
            }
        }
    }
    lines.push('');

    lines.push('  NVME:');
    for (const k in data[NVME_KEY]) {
        let v = data[NVME_KEY][k];
        if (typeof v == 'object') {
            for (const vk in v) {
                if (vk.endsWith('_input')) {
                    lines.push(`${k}: ${v[vk]}°C`);
                }
            }
        }
    }
    lines.push('');

    // console.log(lines.join('\n'));
    console.log(JSON.stringify({ tooltip: lines.join('\n').trim() }));
});
