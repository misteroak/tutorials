import React, { Component } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faHeart as solidHeart } from "@fortawesome/free-solid-svg-icons";
import { faHeart as emptyHearty } from "@fortawesome/free-regular-svg-icons";

class Like extends Component {
  render() {
    const icon = this.props.liked ? solidHeart : emptyHearty;

    return (
      <span className="m-2">
        <FontAwesomeIcon
          icon={icon}
          style={{ cursor: "pointer" }}
          onClick={this.props.onClick}
        />
      </span>
    );
  }
}

export default Like;
