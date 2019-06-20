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

var url = require('url');

function* dfs(starting) {
	var nodespec = path.join(starting, "NodeSpec");

	if (fs.existsSync(nodespec)) {
    	var content = fs.readFileSync(nodespec, 'utf8');
    	yield starting + '\n';
    	var contentLines = content.split('\n');
    	for (var i = 0; i < contentLines.length; i++) {
    		yield contentLines[i];
    	}
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

function* searchingFor(starting, keyword) {
	var nodespec = path.join(starting, "NodeSpec");

	if (fs.existsSync(nodespec)) {
    	var content = fs.readFileSync(nodespec, 'utf8');
    	var fileName = content.split('\n')[1];
    	console.log('fileName is ' + fileName);
    	if (fileName.length > 0) {
    		var fullFileName = path.join(starting, fileName);
    		var fileContent = fs.readFileSync(fullFileName, 'utf8');
    		if (fileContent.indexOf(keyword) != -1) {
    			yield fullFileName;
    		}
    	}
  	}

  	var subDirs = getDirectories(starting);

  	for (var index = 0; index < subDirs.length; index++) {
  		const iterator = searchingFor(subDirs[index], keyword);
  		var line;
  		line = iterator.next().value;
  		while(!(line === '% ENDING')) {
  			yield line;
  			line = iterator.next().value;
  		}
  	}

  	yield "% ENDING";
}

function getSourcesDictionary() {
	var tableOfContents = [];
    var contentSubject = null;

	const iterator = dfs(directoryPath);
	line = iterator.next().value;
	while(!(line === '% ENDING')) {
  		var path = line;
  		line = iterator.next().value;
  		var title = line;

  		if (title.startsWith("\\branch")) {
            if (contentSubject != null) {
                tableOfContents.push(contentSubject);
            }
            contentSubject = {};
            var regex = /\\branch{(.*)}.*/g;
            var found = regex.exec(title);
            contentSubject.title = found[1];
            contentSubject.articles = [];
        } else if (title.startsWith("\\section")) {
            var item = {};
            var regex = /\\section{(.*)}.*/g;
            var found = regex.exec(title);
            if (found) {
            	item.title = found[1];
            	item.fileName = iterator.next().value;
            	item.path = path.replace("/Users/zechen/Documents/PhantasiaAcademia", "SourceAcademia");
            	item.fullFileName = item.path + "/" + item.fileName;
            	contentSubject.articles.push(item);
            } else {
            	iterator.next().value; // consume the trash
            }
        }
		iterator.next().value; // empty line
        line = iterator.next().value;
	}

    tableOfContents.push(contentSubject);
    return tableOfContents;
}

function searchSources(keyword) {
	var files = [];
	const searchingIter = searchingFor(directoryPath, keyword);
	line = searchingIter.next().value;
	while (!(line === '% ENDING')) {
		files.push(line);
		line = searchingIter.next().value;
	}
	return files;
}


http.createServer(function (request, response) {
	var url_parts = url.parse(request.url, true);
	var query = url_parts.query;
	console.log(query);
    response.writeHead(200, {'Content-Type': 'text/plain'});
    response.writeHead(200, {'Access-Control-Allow-Origin': '*'});
    var resp;
	if (query["require"] === "tableOfContents") resp = JSON.stringify(getSourcesDictionary());
	else if (query["require"] === "search") resp = JSON.stringify(searchSources(query['keyword']));
	console.log('resp ' + resp);
	response.write(resp, 'utf8');
	response.end("\n");
}).listen(8081);
console.log('Server running at http://127.0.0.1:8081/');
getSourcesDictionary();
console.log(searchSources('Gau'))


