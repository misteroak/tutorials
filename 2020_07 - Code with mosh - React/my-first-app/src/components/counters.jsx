import React, { Component } from "react";
import Counter from "./counter";

class Counters extends Component {
  render() {
    return (
      <React.Fragment>
        <button
          className="btn btn-primary btn-sm m-2"
          onClick={this.props.onReset}
        >
          Reset
        </button>

        {this.props.counters.map((counter) => (
          <Counter
            key={counter.id}
            counter={counter}
            onIncrement={this.props.onIncrement}
            onReduction={this.props.onReduction}
            onDelete={this.props.onDelete}
            onLikeClick={this.props.onLikeClick}
          />
        ))}
      </React.Fragment>
    );
  }
}

export default Counters;
