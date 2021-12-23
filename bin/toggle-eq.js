#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const process = require('process');
const child_process = require('child_process');

const activeIdx = 5;
const eqRcPath = path.join(process.env.HOME, '.config/pulse/equalizerrc');
const lines = fs.readFileSync(eqRcPath, 'UTF-8').toString().split('\n');


if (lines[activeIdx] === '1') {
    lines[activeIdx] = '0';
    console.log('Equalizer off');
} else if (lines[activeIdx] === '0') {
    lines[activeIdx] = '1';
    console.log('Equalizer on');
} else {
    console.error('Unknown state');
    process.exit(1);
}

fs.writeFileSync(eqRcPath, lines.join('\n'));

child_process.spawnSync('pulseaudio-equalizer', ['interface.applysettings'])
// const { output, } = child_process.spawnSync('bash', ['/home/olback/.config/waybar/modules/eq.sh'])
// console.log(output[1].toString())

