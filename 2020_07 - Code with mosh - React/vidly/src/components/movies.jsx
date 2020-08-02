import React, { Component } from "react";
import Pagination from "./common/pagination";
import ListGroup from "./common/listGroup";
import MoviesTable from "./moviesTable";
import { paginate } from "../utils/paginate";
import _ from "loadsh";
import { Link } from 'react-router-dom';

import { getMovies } from "../services/fakeMovieService";
import { getGenres } from "../services/fakeGenreService";

class Movies extends Component {
  state = {
    movies: [],
    genres: [],
    pageSize: 4,
    currentPage: 1,
    selectedGenre: null,
    sortColumn: { path: "title", order: "asc" },
  };

  componentDidMount() {
    // in real world applications initialize from server
    const genres = [{ _id: -1, name: "All Genres" }, ...getGenres()];
    this.setState({
      movies: getMovies(),
      genres: genres,
      selectedGenre: genres[0],
    });
  }

  handleDelete = (movie) => {
    this.setState({
      movies: this.state.movies.filter((m) => m._id !== movie._id),
    });
  };

  handleLike = (movie) => {
    const newMovies = [...this.state.movies];
    const index = newMovies.indexOf(movie);
    const newMovie = newMovies[index];
    newMovie.liked = !newMovie.liked;
    this.setState({ movies: newMovies });
  };

  handlePageChange = (page) => {
    this.setState({ currentPage: page });
  };

  handleGenreSelect = (genre) => {
    this.setState({ selectedGenre: genre, currentPage: 1 });
  };

  handleSort = (sortColumn) => {
    this.setState({ sortColumn: sortColumn });
  };

  getPageData = () => {
    const { pageSize, currentPage, movies: allMovies, selectedGenre, sortColumn } = this.state;

    // first filter
    const filteredMovies =
      selectedGenre && selectedGenre._id !== -1
        ? allMovies.filter((movie) => movie.genre._id === selectedGenre._id)
        : allMovies;

    // then sort
    const sortedMovies = _.orderBy(filteredMovies, [movie => movie.title.toLowerCase()], [sortColumn.order]);
    // const sortedMovies = _.orderBy(filteredMovies, [sortColumn.path], [sortColumn.order]); 

    // then paginate
    const pageMovies = paginate(sortedMovies, currentPage, pageSize);

    return { totalCount: filteredMovies.length, pageMovies };
  };

  render() {
    const { pageSize, currentPage, genres, selectedGenre, sortColumn } = this.state;
    const { totalCount: count, pageMovies } = this.getPageData();

    return (
      <div className="row">
        <div className="col-2">
          <ListGroup items={genres} currentItem={selectedGenre} onItemSelect={this.handleGenreSelect} />
        </div>
        <div className="col">
          <Link to='/movies/new' className="btn btn-primary" style={{marginBottom: 20}}>
            New Movie
          </Link>
          <div className="p-2">Found {count} movies in the database.</div>
          <MoviesTable
            movies={pageMovies}
            sortColumn={sortColumn}
            onLike={this.handleLike}
            onDelete={this.handleDelete}
            onSort={this.handleSort}
          />

          <Pagination
            itemsCount={count}
            pageSize={pageSize}
            currentPage={currentPage}
            onPageChange={this.handlePageChange}
          />
        </div>
      </div>
    );
  }
}

export default Movies;
