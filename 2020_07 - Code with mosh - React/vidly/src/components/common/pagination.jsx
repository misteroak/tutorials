import React, { Component } from "react";
import PropTypes from "prop-types";
import _ from "loadsh"; // underscore

class Pagination extends Component {
  render() {
    const { itemsCount, pageSize, onPageChange } = this.props;
    let { currentPage } = this.props;

    const pagesCount = Math.ceil(itemsCount / pageSize);
    if (pagesCount < 2) return null;

    const pages = _.range(1, pagesCount + 1);
    if (!currentPage) currentPage = 1;

    return (
      <nav>
        <ul className="pagination">
          {pages.map((page) => (
            <li
              className={`page-item ${page === currentPage ? "active" : ""}`}
              key={page}
              style={{ cursor: "pointer" }}
            >
              <button className="page-link" onClick={() => onPageChange(page)}>
                {page}
              </button>
            </li>
          ))}
        </ul>
      </nav>
    );
  }
}

Pagination.propTypes = {
  itemsCount: PropTypes.number.isRequired,
  pageSize: PropTypes.number.isRequired,
  currentPage: PropTypes.number.isRequired,
  onPageChange: PropTypes.func.isRequired,
};

export default Pagination;
