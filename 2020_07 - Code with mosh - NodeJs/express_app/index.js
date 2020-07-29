const debug = require('debug')('app:startup');
const express = require('express');
const morgan = require('morgan');
const config = require('config');

const homeRoute = require('./routes/home');
const genresRoute = require('./routes/genres');

const app = express();

app.set('view engine', 'pug');
app.set('views', './views'); // optional, this is the default

console.log('');
console.log("* Config");
debug('Application name: ' + config.get('name'));
debug('Mail server: ' + config.get('mail server'));

console.log('');
console.log("* Environment ");
debug(`NODE_ENV: ${process.env.NODE_ENV}`);
if (app.get('env') === 'development') {
    app.use(morgan('tiny'));
    debug("Morgan enabled...");
}

app.use(express.json());
app.use('/', homeRoute);
app.use('/api/genres/', genresRoute);

console.log('');
console.log("* Application ");


const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Listening on port ${ port }`);
})

