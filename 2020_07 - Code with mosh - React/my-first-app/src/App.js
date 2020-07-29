import React, { Component } from "react";
import "./App.css";
import NavBar from "./components/navbar";
import Counters from "./components/counters";

class App extends Component {
  state = {
    counters: [
      { id: 1, value: 0, liked: false },
      { id: 2, value: 0, liked: false },
      { id: 3, value: 0, liked: false },
      { id: 4, value: 0, liked: false },
      { id: 5, value: 0, liked: false },
    ],
  };

  constructor() {
    // * Called only once
    // * Don't call setState b/c setState can only be called when a component is rendered and placed in the DOM
    // * Must explictly pass props if need to acces it. Also pass to super(props)

    super();
    console.log("App: onstructor");
  }

  componentDidMount() {
    // * Perfect place to put ajax call to get data from server, then call setState with the new data
    // console.log("App: mounted (componentDidMount)");
  }

  handleIncrement = (counter) => {
    const counters = [...this.state.counters]; // copy by ref!!!
    const index = counters.indexOf(counter); // find the index so we can create a copy
    counters[index] = { ...counter }; // create a new copy of counter
    counters[index].value++;
    this.setState({ counters: counters });
  };

  handleReduction = (counter) => {
    const counters = [...this.state.counters]; // copy by ref!!!
    const index = counters.indexOf(counter); // find the index so we can create a copy
    counters[index] = { ...counter }; // point to a new counter
    counters[index].value--;
    this.setState({ counters: counters });
  };

  handleDelete = (counter) => {
    this.setState({
      counters: this.state.counters.filter((c) => c.id !== counter.id),
    });
  };

  handleLikeClick = (counter) => {
    const counters = [...this.state.counters]; // copy by ref!!!
    const index = counters.indexOf(counter); // find the index so we can create a copy
    counters[index] = { ...counter }; // point to a new counter
    counters[index].liked = !counters[index].liked;
    this.setState({ counters: counters });
  };

  handleReset = () => {
    console.log("reset...");
    const counters = this.state.counters.map((c) => {
      c.value = 0;
      return c;
    });

    console.log(counters);

    this.setState({
      counters: counters,
    });
  };

  render() {
    // console.log("App: render");
    return (
      <React.Fragment>
        <NavBar
          totalCounters={this.state.counters.filter((c) => c.value > 0).length}
        />
        <main className="container">
          <Counters
            counters={this.state.counters}
            onIncrement={this.handleIncrement}
            onReduction={this.handleReduction}
            onDelete={this.handleDelete}
            onReset={this.handleReset}
            onLikeClick={this.handleLikeClick}
          />
        </main>
      </React.Fragment>
    );
  }
}

export default App;
