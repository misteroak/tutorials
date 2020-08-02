import React from "react";
import Form from "./common/form";
import Joi from "@hapi/joi";
import { getMovie, saveMovie } from "../services/fakeMovieService";
import { getGenres } from "../services/fakeGenreService";

class MovieForm extends Form {
  state = {
    // form data
    data: {
      title: "",
      genreId: "",
      numberInStock: 0,
      dailyRentalRate: 0.0,
    }, // as a rule of thumb - when initializing a form, use empty string or data from servers, not nulls

    genres: [],

    // used in form validation
    errors: {}, // holds all the errors in this page. start with empty object, and add properties as errors occur. The properties will map to the names of our input fields ("username", "password")
  };

  schema = {
    _id: Joi.string(),
    title: Joi.string().min(3).required().label("Title"),
    genreId: Joi.string().label("Genre"),
    numberInStock: Joi.number().integer().min(0).required().label("Number in Stock"),
    dailyRentalRate: Joi.number().min(0.0).max(10.0).label("Daily Rental Rate"),
  };

  componentDidMount() {
    // get genres from "server"
    const genres = getGenres();
    this.setState({ genres: genres });

    // do we need to populate the form with an existing movie object?
    const movieId = this.props.match.params.id;
    if (movieId === "new") return;

    const movie = getMovie(movieId);
    if (!movie) return this.props.history.replace("/not-found"); // using .replace so that the back button won't take the user to a page with an invalid movie id, and will get in an infinite loop

    this.setState({ data: this.mapToViewModel(movie) });
  }

  // This is an important function - our API are for general use, but each page has its own data
  //  and needs part of the data. Hence, the page should map the data from the API to its own needs.
  mapToViewModel(movie) {
    return {
      _id: movie._id,
      title: movie.title,
      genreId: movie.genre._id,
      numberInStock: movie.numberInStock,
      dailyRentalRate: movie.dailyRentalRate,
    };
  }

  doSubmit = () => {
    saveMovie(this.state.data);
    this.props.history.push("/movies");
  };

  render() {
    const movieId = this.props.match.params.id;

    const formTitle = movieId === "new" ? "New Movie" : "Edit Movie";

    return (
      <div>
        <h1>{formTitle}</h1>
        <form onSubmit={this.handleSubmit}>
          {this.renderInput("title", "Title", "text", true)}
          {this.renderSelect("genreId", "Genre", getGenres())}
          {this.renderInput("numberInStock", "Number in Stock", "number")}
          {this.renderInput("dailyRentalRate", "Rate", "text")}
          {this.renderSubmitButton("Save")}
        </form>
      </div>
    );
  }
}

export default MovieForm;
