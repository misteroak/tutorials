import React, { Component } from "react";

class Input extends Component {
  
  render() {

    const { name, label, value, onChange, type, autoFocus, error } = this.props;

    return (
      <div className="form-group">
        <label htmlFor={name}>{label}</label>
        {/* Note the 'value' and onChange attribute on input below, this makes it a controlled element - moves it's state outside of the element */}
        <input
          value={value}
          onChange={onChange}
          name={name}
          autoFocus={autoFocus}
          id={name}
          type={type}
          className="form-control"
          // ref={this.username} // how to use references
        />
        {error && <div className="alert alert-danger">{error}</div>}
      </div>
    );
  }
}

export default Input;
