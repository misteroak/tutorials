import React, { Component } from "react";

class ProductDetails extends Component {
  handleSave = () => {
    // programatic navigation (ie not as a reaction to <a> or <Link> click)
    this.props.history.push("/products");
  };

  render() {
    return (
      <div>
        <h1>Product Details - {this.props.match.params.id} </h1>
        <button onClick={this.handleSave}>Save</button>
      </div>
    );
  }
}

export default ProductDetails;
