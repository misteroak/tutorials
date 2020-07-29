import React, { Component } from "react";

class NavBar extends Component {
  render() {
    console.log('NavBar - Rendered');
    return (
      <nav className="navbar navbar-light bg-light">
        <a href="." className="navbar-brand">
          NavBar {" "}
          <span className="badge badge-pill badge-secondary"> {this.props.totalCounters}
          </span>
        </a>
      </nav>
    );
  }
}

export default NavBar;
