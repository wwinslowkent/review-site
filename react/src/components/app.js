import React, { Component } from 'react';
import Review from './review';



class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      upvoted: false,
      downvoted: false,
      reviews: []
     };

    this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount() {
    fetch('/api/v1/games')
      .then(response => {
        if (response.ok) {
          return response;
        }
      })
      .then(response => response.json())
      .then(data => {
        console.log(data);
        this.setState({ reviews: data.reviews });
      });
  }

  handleClick(button, index) {
    let upVote = this.props.data[index].upvoted;
    let downVote = this.props.data[index].downvoted;

    if (button==='upvote') {
      this.props.data[index].upvoted = !upVote;
      this.props.data[index].downvoted = false;
    }
    if (button==='downvote') {
      this.props.data[index].downvoted = !downVote;
      this.props.data[index].upvoted = false;
    }
    this.setState({upvoted: true});



  }

  render() {
    return (
      <Review
        whatever={this.state.whatever}
        />
    );
  }





}
