import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.state = {
        result: 0,
        num1: "",
        num2: ""
    };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
  }

  // your code here
  setNum1(e) {
    let num1 = "";
    if (e.target.value) {
        num1 = parseInt(e.target.value); 
    }
    this.setState({ num1 });
  }

  setNum2(e) {
    let num2 = "";
    if (e.target.value) {
        num2 = parseInt(e.target.value); 
    }
    this.setState({ num2 });
  }

  add(e) {
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({ result });
  }

  subtract(e) {
    e.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({ result });
  }

  multiply(e) {
    e.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({ result });
  }

  clear(e) {
    e.preventDefault();
    this.setState({num1: "", num2: "", result: 0 });
  }

  divide(e) {
    e.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setState({ result });
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>

        <input onChange={this.setNum1} value={this.state.num1}/>
        <input onChange={this.setNum2} value={this.state.num2}/>
        <br />
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.divide}>/</button>
        <button onClick={this.multiply}>*</button>
      </div>
    );
  }
}

export default Calculator;
