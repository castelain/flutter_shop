#! /usr/bin/env node

const fs = require('fs');
const path = require('path');

function copy(dstName, src) {
	console.log('copy start...');
	fs.createReadStream(src).pipe(fs.createWriteStream(dstName));
	console.log('copy end...');
}

function main() {
	const argv = require('yargs').option('d', {
		alias: 'dst',
		demand: true,
		default: 'copy',
		type: 'string',
		describe: 'The destination filename'
	}).option('s', {
		alias: 'src',
		demand: true,
		type: 'string',
		describe: 'The source path'
	}).example('copy -d=copy -s=./test.txt', 'Copy a file text.txt to the destination path').help('h').usage('Usage: copy [options]').epilog('Copyright @2020/5/21')
		.argv;
	copy(argv.dst + path.extname(argv.src), argv.src);
}

main();
