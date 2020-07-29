import React, { Component } from "react";
import Like from "./like";

class Counter extends Component {
  styles = {
    fontSize: 20,
    fontWeight: "bold",
  };

  // constructor() {
  //   super();
  //   this.handleIncrement = this.handleIncrement.bind(this);
  // }

  // Arrow functions automatically bind this, so we don't need to bind this in the constructor to each event handler

  componentDidMount() {
    // console.log("counter: mounted (componentDidMount");
  }

  componentDidUpdate(prevProps, prevState) {
    // console.log("counter: updated (componentDidUpdate");
    // console.log("prevProps", prevProps);
    // console.log("prevState", prevState);
    // Use prevProps, prevState and current props and state to decide whether to issue a server call.
    // if (prevProps.counter.value != this.props.counter.value) {
    //   ajax call to server based on new data from props
    // }
  }

  componentWillUnmount() {
    console.log("counter: Unmount (componentWillUnmount");

    // Gives us an opportunity to clean things before component is removed from the DOM - timers, listeners.
    // Otherwise will create a memoery leak
  }

  render() {
    return (
      <div className="row align-items-center">
        <div className="col-1 text-center">
          <span style={this.styles} className={this.getBadgeClasses()}>
            {this.formatCount()}
          </span>
        </div>
        <div className="col">
          <button
            onClick={() => this.props.onIncrement(this.props.counter)}
            style={this.styles}
            className="btn btn-secondary btn-sm m-2"
          >
            +
          </button>
          <button
            onClick={() => this.props.onReduction(this.props.counter)}
            style={this.styles}
            className={this.getReductionButtonClasses()}
            disabled={this.props.counter.value === 0}
          >
            -
          </button>
          <button
            onClick={() => this.props.onDelete(this.props.counter)}
            style={this.styles}
            className="btn btn-danger btn-sm m-2"
          >
            Delete
          </button>
            <Like
              liked={this.props.counter.liked}
              onClick={() => this.props.onLikeClick(this.props.counter)}
            />
        </div>
      </div>
    );
  }

  getBadgeClasses() {
    let classes = "badge m-2 badge-";
    classes += this.props.counter.value === 0 ? "warning" : "primary";
    return classes;
  }

  formatCount() {
    const { value } = this.props.counter;
    return value === 0 ? "zero" : value;
  }

  getReductionButtonClasses() {
    let classes = "btn btn-secondary btn-sm m-2";
    classes += this.props.counter.value === 0 ? " disabled" : "";
    return classes;
  }
}

export default Counter;
