let fs = require('fs')

fs
	.readdirSync(__dirname)
	.map(file => file.split('.'))
	.filter(file => file[file.length - 1] === 'json')
	.map(file => file[0])
	.map(name => 
			exports[name] = require('./' + name) 
	)
