const fs=require('node:fs');
const file='js/main.js';let text=fs.readFileSync(file,'utf8');
text=text.replace('23°53′ S · 46°25′ W','${e(c.contact.city)} · ${e(c.contact.state)}').replace("$('h2',d);",'');
fs.writeFileSync(file,text);
