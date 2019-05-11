var http = require("http");
//requiring path and fs modules
const path = require('path');
const fs = require('fs');
const { lstatSync, readdirSync } = require('fs')
//joining path of directory 
const directoryPath = __dirname;
//passsing directoryPath and callback function
const isDirectory = source => lstatSync(source).isDirectory();
const getDirectories = source => readdirSync(source).map(name => path.join(source, name)).filter(isDirectory);

function* dfs(starting) {
	var nodespec = path.join(starting, "NodeSpec");

	if (fs.existsSync(nodespec)) {
    	var content = fs.readFileSync(nodespec, 'utf8');
    	yield starting + '\n';
    	yield content;
  	}

  	var subDirs = getDirectories(starting);

  	for (var index = 0; index < subDirs.length; index++) {
  		const iterator = dfs(subDirs[index]);
  		var line;
  		line = iterator.next().value;
  		while(!(line === '% ENDING')) {
  			yield line;
  			line = iterator.next().value;
  		}
  	}

  	yield "% ENDING";
}


http.createServer(function (request, response) {
    response.writeHead(200, {'Content-Type': 'text/plain'});
    response.writeHead(200, {'Access-Control-Allow-Origin': '*'});
	const iterator = dfs(directoryPath);
	line = iterator.next().value;
	while(!(line === '% ENDING')) {
  		response.write(line, 'utf8');
  		line = iterator.next().value;
	}
	response.end("\n");
}).listen(8081);
console.log('Server running at http://127.0.0.1:8081/');
