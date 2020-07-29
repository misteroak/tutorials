const express = require('express');
const Joi = require('@hapi/joi');
const router = express.Router();

const genres = [
    { id: 1, name: "Action" },
    { id: 2, name: "Comdey" },
    { id: 3, name: "Drama" },
]

function getGenreById(id) {
    return genres.find(c => c.id === parseInt(id));
}

function validateGenre(genre) {
    const genre_schema = Joi.object({
        name: Joi.string().min(3).required()
    });
    
    return genre_schema.validate(genre);
}

router.get('/', (req, res) => {
    res.send(genres);
})

router.get('/:id', (req, res) => {
    const genre = getGenreById(req.params.id);
    if (!genre) return res.status(404).send(`A genre with id ${req.params.id} was not found`);
    
    res.send(genre);
})

router.post('/', (req, res) => {
    
    const {error} = validateGenre(req.body);
    if (error) return res.status(400).send(error.details[0].message);
    
    const genre = {
        id: genres.length + 1,
        name: req.body.name,
    }

    genres.push(genre);

    res.send(genres);
})

router.put('/:id', (req, res) => {
    
    // Lookup the genre 
    const genre = getGenreById(req.params.id);
    if (!genre) return  res.status(404).send(`A genre with id ${req.params.id} was not found`);

    // Validate new genre
    const {error} = validateGenre(req.body);
    if (error) return res.status(400).send(error.details[0].message);

    // Update    
    genre.name = req.body.name;
    res.send(genre);
})

router.delete('/:id', (req, res) => {
    
    // Lookup the genre 
    const genre = getGenreById(req.params.id);
    if (!genre) return  res.status(404).send(`A genre with id ${req.params.id} was not found`);

    // Delete
    genres.splice(genres.indexOf(genre), 1);
    res.send(genre);
})

module.exports = router;