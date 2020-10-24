#! /usr/bin/env node

const yargs = require('yargs');
const fs = require('fs');
const path = require('path');

function processTemplate(data, entity) {
	let str = data.toString();
	let formatStr = str.replace(/{%.*%}/g, entity);
	return Buffer.from(formatStr, 'utf8');
}

function generate(destination, entity) {
	const rs = fs.createReadStream(path.resolve(__dirname) + '/init-template.txt');
	const ws = fs.createWriteStream(destination);
	rs.on('data', function (chunk) {
		chunk = processTemplate(chunk, entity);
		ws.write(chunk);
		if (!ws.write(chunk)) {
			rs.pause();
		}
	});
	rs.on('end', function () {
		ws.end();
	});
	ws.on('drain', function () {
		rs.resume();
	});
}

function main() {
	const argv = yargs.option('d', {
		alias: 'destination',
		demand: true,
		describe: 'the destination path of template',
		type: 'string'
	}).option('e', {
		alias: 'entity',
		demand: true,
		describe: 'the name of entity in APIs',
		type: 'string'
	}).option('p', {
		alias: 'placeholder',
		demand: true,
		describe: 'the placeholder in template',
		default: '{%entity%}',
		type: 'string'
	}).usage('Usage: generate [options]').example('generate -d=template.js -e=User -p={%entity%}', 'genarate a template file for restful api').argv;

	console.log('Generate a template start...');
	generate(argv.destination, argv.entity);
	console.log('Generate a template end...');
}

main()
