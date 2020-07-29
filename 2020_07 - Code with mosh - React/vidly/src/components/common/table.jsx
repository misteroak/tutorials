import React, { Component } from "react";
import PropTypes from 'prop-types';
import TableHeader from "./tableHeader";
import TableBody from "./tableBody";

class Table extends Component {
  state = {};
  render() {
    
    const { rows, columns, sortColumn, onSort } = this.props;

    return (
      <table className="table">
        <TableHeader columns={columns} sortColumn={sortColumn} onSort={onSort} />
        <TableBody rows={rows} columns={columns} />
      </table>
    );
  }
}

Table.propTypes = {
  rows: PropTypes.array.isRequired,
  columns: PropTypes.array.isRequired,
  sortColumn: PropTypes.object.isRequired,
  onSort: PropTypes.func.isRequired
};

export default Table;
