import React, { Component } from "react";
import PropTypes from "prop-types";

class TableHeader extends Component {
  
  raiseSort = (path) => {
    
    const { sortColumn: currentSortColumn, onSort } = this.props;

    const newSortColumn = { ...currentSortColumn };

    if (newSortColumn.path === path) {
      newSortColumn.order = newSortColumn.order === "asc" ? "desc" : "asc";
    } else {
      newSortColumn.path = path;
      newSortColumn.order = "desc";
    }

    onSort(newSortColumn);
  };

  render() {
    const { columns } = this.props;

    return (
      <thead>
        <tr>
          {columns.map((col) => (
            <th
              key={col.path || col.key}
              style={col.path ? { cursor: "pointer" } : { cursor: "default" }}
              onClick={col.path ? () => this.raiseSort(col.path) : null}
              scope="col"
            >
              {col.label}
            </th>
          ))}
        </tr>
      </thead>
    );
  }
}

TableHeader.propTypes = {
  columns: PropTypes.array.isRequired,
  sortColumn: PropTypes.object,
  onSort: PropTypes.func.isRequired,
};

export default TableHeader;
