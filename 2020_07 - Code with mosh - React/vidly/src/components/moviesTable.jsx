import React, { Component } from "react";
import PropTypes from "prop-types";
import Table from "./common/table";
import { Link } from "react-router-dom";

import Like from "./common/like";

class MoviesTable extends Component {
  columns = [
    { path: "title", label: "Title", content: (movie) => this.getMovieTitleLink(movie) },
    { path: "genre.name", label: "Genre" },
    { path: "numberInStock", label: "Stock" },
    { path: "dailyRentalRate", label: "Rate" },
    { key: "actions", label: "Actions", content: (movie) => this.getTableRowActionsContent(movie) },
  ];

  getMovieTitleLink = (movie) => {
    return <Link to={`/movies/${movie._id}`}>{movie.title}</Link>;
  }
  
  getTableRowActionsContent = (movie) => {
    const { onLike, onDelete } = this.props;

    return (
      <div>
        <Like liked={movie.liked} onClick={() => onLike(movie)} />
        <button onClick={() => onDelete(movie)} className="btn btn-danger btn-sm m-2">
          Delete
        </button>{" "}
      </div>
    );
  };

  render() {
    const { movies, sortColumn, onSort } = this.props;
    if (movies.length === 0) return null;
    return <Table rows={movies} columns={this.columns} sortColumn={sortColumn} onSort={onSort} />;
  }
}

MoviesTable.propTypes = {
  movies: PropTypes.array.isRequired,
};

export default MoviesTable;
