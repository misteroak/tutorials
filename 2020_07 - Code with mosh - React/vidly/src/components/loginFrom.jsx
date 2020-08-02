import React from 'react';
import Form from "./common/form";
import Joi from "@hapi/joi";

class LoginForm extends Form {
  
  // schema specific to this form
  schema = {
    username: Joi.string().alphanum().min(3).required().label("Username"),
    password: Joi.string().pattern(new RegExp("^[a-zA-Z0-9]{3,30}$")).required().label("Password"),
  };

  state = {
    // form data
    data: { username: "", password: "" }, // as a rule of thumb - when initializing a form, use empty string or data from servers, not nulls

    // used in form validation
    errors: {}, // holds all the errors in this page. start with empty object, and add properties as errors occur. The properties will map to the names of our input fields ("username", "password")
  };

  // creates a reference we can use to access react virtual DOM objects. This instead of using document.getElementById, which we should never user with React.
  // we should try to minimize refs. Use it for setting focus, animations and 3rd party DOM libraries.
  // don't over use them
  // username = React.createRef();

  componentDidMount() {
    // This is an example of where refs are proper (however, this specific call is not needed, see autoFocs property on username)
    // this.username.current.focus();
  }

  doSubmit = () => {
    // Call the server and redirect the user to a different page
    console.log("submitted");
  };

  render() {

    return (
      <div>
        <h1>Login</h1>
        <form onSubmit={this.handleSubmit}>
          {this.renderInput('username', 'Username', 'text', true)}
          {this.renderInput('password', 'Password','password', false)}
          {this.renderSubmitButton ("Submit")}
        </form>
      </div>
    );
  }
}

export default LoginForm;
