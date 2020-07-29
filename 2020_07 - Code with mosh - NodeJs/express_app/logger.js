const EventEmitter = require('events');

const serviceUrl = 'https://httpbin.org/get?message=Message';

class Logger extends EventEmitter {
    log(message) {
        
        console.log(message);
    
        // Raise an event
        this.emit('messageLogged', {message:message});
    }
}

module.exports = Logger;
