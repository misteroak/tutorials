import React, { Component } from "react";

class Select extends Component {
  render() {
    const {
      name,
      label,
      value,
      onChange,
      autoFocus,
      selectOptions,
      error,
    } = this.props;

    return (
      <div className="form-group">
        <label htmlFor={name}>{label}</label>
        <select className="form-control" value={value} onChange={onChange} name={name} autoFocus={autoFocus} id={name}>
          <option value=""></option>
          {selectOptions.map((option) => (
            <option key={option._id} value={option._id}>
              {option.name}
            </option>
          ))}
        </select>
        {error && <div className="alert alert-danger">{error}</div>}
      </div>
    );
  }
}

export default Select;
