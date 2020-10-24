#! /usr/bin/env node

const fs = require('fs');

function copy(dst, src) {
	console.log('copy start...');
	fs.writeFileSync(dst, fs.readFileSync(src));
	console.log('copy end...');
}

function main(){
	const argv = require('yargs').option('d', {
		alias: 'dst',
		demand: true,
		default: 'copy',
		type: 'string',
		describe: 'The destination path'
	}).option('s', {
		alias: 'src',
		demand: true,
		type: 'string',
		describe: 'The source path'
	}).example('copy -d=copy.txt -s=./test.txt', 'Copy a file text.txt to the destination path').help('h').usage('Usage: copy [options]').epilog('Copyright @2020/5/21')
		.argv;
	copy(argv.dst, argv.src);
}

main();
