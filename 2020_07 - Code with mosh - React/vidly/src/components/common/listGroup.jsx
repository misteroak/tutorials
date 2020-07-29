import React, { Component } from "react";
import PropTypes from "prop-types";

class ListGroup extends Component {
  render() {
    const {
      items,
      currentItem,
      onItemSelect,
      textProperty, // textProperty and valueProperty let us use ListGroup with any type of key-value pairs. Will need bracket notation inside ListGroup
      valueProperty, // since these too are so common, we can set defaults. See defaultProps at the bottom.
    } = this.props;

    return (
      <ul className="list-group">
        {items.map((item) => (
          <button
            type="button"
            key={item[valueProperty]}
            className={`list-group-item list-group-item-action ${
              item === currentItem ? "active" : ""
            }`}
            onClick={() => onItemSelect(item)}
          >
            {item[textProperty]}
          </button>
        ))}
      </ul>
    );
  }
}

ListGroup.defaultProps = {
  textProperty: 'name',
  valueProperty: '_id'
};

ListGroup.propTypes = {
  items: PropTypes.array.isRequired,
  currentItem: PropTypes.object,
  onItemSelect: PropTypes.func.isRequired
}

export default ListGroup;
