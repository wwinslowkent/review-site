import React, { Component } from 'react';
import Review from './review';



class App extends Component {
  constructor(props) {
    super(props);
    this.state = { upvoted: false, downvoted: false };

    this.handleClick = this.handleClick.bind(this);
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







}
