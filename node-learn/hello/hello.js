#!/usr/bin/env node
var argv = require('yargs').option('n', {
	alias: 'name',
	demand: true,
	default: 'jasmine',
	describe: 'Your name',
	type: 'string'
}).usage('Usage: hello [options]').example('hello -n molly', 'say hello to molly').help('h').alias('h', 'help').epilog('copyright 2020').argv;

console.log('Hello world for', argv.name);
console.log(argv);