import React, { Component } from "react";
import Joi from "@hapi/joi";
import Input from "./input";
import Select from "./select";

class Form extends Component {
  state = {
    data: {},
    errors: {},
  };

  // valudate all form
  validate = () => {
    const schemaObj = Joi.object(this.schema);
    const result = schemaObj.validate(this.state.data, { abortEarly: false });
    if (!result.error) return null; // no errors

    // map Joi's error result to our errors object that our application can understand
    const errors = {};
    for (let item of result.error.details) {
      errors[item.path[0]] = item.message;
    }

    return errors;
  };

  // valudate a specific form input while user is typing - only want to show changes for that field
  // here we only want to validate one input
  validateProperty = (input) => {
    // the property we want to validate
    const property = { [input.name]: input.value }; // [] - computed arguments, makes the object property name calculated

    // schema just for the property we want to validate
    const s = { [input.name]: this.schema[input.name] };
    const propertySchemaObj = Joi.object(s); // create a schema just of the field we're validating

    // validate
    const result = propertySchemaObj.validate(property); // abort early so we only show one error at a time

    return result.error ? result.error.details[0].message : null;
  };

  handleChange = (e) => {
    const errors = { ...this.state.errors };
    const errorMessage = this.validateProperty(e.currentTarget);
    if (errorMessage) {
      errors[e.currentTarget.name] = errorMessage;
    } else {
      delete errors[e.currentTarget.name];
    }

    // update state with new errors
    const data = { ...this.state.data };
    data[e.currentTarget.name] = e.currentTarget.value;
    this.setState({ data: data, errors: errors });
  };

  handleSubmit = (e) => {
    // Usee to preven full page refresh
    e.preventDefault();

    const errors = this.validate();
    this.setState({ errors: errors || {} }); // errors should always be an object, should never be null
    if (errors) return;

    this.doSubmit();
  };

  renderInput = (name, label, type, autoFocus = false) => {
    const { data, errors } = this.state;

    return (
      <Input
        name={name}
        label={label}
        value={data[name]}
        onChange={this.handleChange}
        type={type}
        autoFocus={autoFocus}
        error={errors[name]}
      />
    );
  };
  
  renderSelect = (name, label, selectOptions, autoFocus = false) => {
    const { data, errors } = this.state;
    console.log(data);
    return (
      <Select
        name={name}
        label={label}
        value={data[name]}
        onChange={this.handleChange}
        autoFocus={autoFocus}
        selectOptions={selectOptions}
        error={errors[name]}
      />
    );
  };

  renderSubmitButton = (label) => {
    return (
      <button disabled={this.validate()} className="btn btn-primary">
        {label}
      </button>
    );
  };

  // Notice: No render, becuase this component is not supposed to render anythig, it's children will
}

export default Form;
