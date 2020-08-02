import React from "react";
import Form from "./common/form";
import Joi from "@hapi/joi";

class LoginForm extends Form {
  // schema specific to this form
  schema = {
    username: Joi.string().alphanum().min(3).required().label("Username"),
    password: Joi.string().pattern(new RegExp("^[a-zA-Z0-9]{5,30}$")).required().label("Password"),
    name: Joi.string().alphanum().min(3).required().label("Name"),
  };

  state = {
    // form data
    data: { username: "", password: "", name: "" }, // as a rule of thumb - when initializing a form, use empty string or data from servers, not nulls

    // used in form validation
    errors: {}, // holds all the errors in this page. start with empty object, and add properties as errors occur. The properties will map to the names of our input fields ("username", "password")
  };

  doSubmit = () => {
    // Call the server and redirect the user to a different page
    console.log("Registerred!");
  };

  render() {
    return (
      <div>
        <h1>Register</h1>
        <form onSubmit={this.handleSubmit}>
          {this.renderInput("username", "Username", "text", true)}
          {this.renderInput("password", "Password", "password", false)}
          {this.renderInput("name", "Name", "name", false)}
          {this.renderSubmitButton("Submit")}
        </form>
      </div>
    );
  }
}

export default LoginForm;
