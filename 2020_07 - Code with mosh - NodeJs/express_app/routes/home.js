const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    // res.send("Hello World"); // to send just a JSON

    res.render('index', {
        title:"My Express App",
        message: "Hello World!"
    })
});

module.exports = router;