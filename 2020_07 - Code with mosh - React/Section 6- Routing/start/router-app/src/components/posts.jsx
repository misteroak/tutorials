import React, { Component } from "react";
import queryString from 'query-string';

class Posts extends Component {
  render() {

    const { match, location } = this.props;

    const res = queryString.parse(location.search);
    console.log(res);


    return (
      <div>
        <h1>Posts</h1>
        Year: {this.props.match.params.year}, Month: {this.props.match.params.month}
      </div>
    );
  }
}

export default Posts;
