import React, { Component } from "react";
import PropTypes from "prop-types";
import _ from "loadsh"; // need it to use path with a nested property

class TableBody extends Component {
  createKey = (row, col) => row._id + (col.path || col.key);

  generateCellContent = (row, col) => {
    if (col.path) return _.get(row, col.path);

    return col.content(row);
  };

  render() {
    const { rows, columns } = this.props;

    return (
      <tbody>
        {rows.map((row) => (
          <tr key={row._id}>
            {columns.map((col) => (
              <td key={this.createKey(row, col)} className="align-middle">
                {this.generateCellContent(row, col)}
              </td>
            ))}
          </tr>
        ))}
      </tbody>
    );
  }
}

TableBody.propTypes = {
  rows: PropTypes.array.isRequired,
  columns: PropTypes.array.isRequired,
};

export default TableBody;
