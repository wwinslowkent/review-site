import React, { Component } from 'react';
import Review from './Review';
import Form from './Form';

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      reviews: [],
      comment: "",
      rating: "",
      clicked: false,
      userId: null

    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleRatingChange = this.handleRatingChange.bind(this);
    this.handleCommentChange = this.handleCommentChange.bind(this);
    this.handleClicked = this.handleClicked.bind(this);
  }

  handleClicked(event) {
    if (this.state.clicked === false){
      this.setState({clicked: true});
    } else {
      this.setState({clicked: false});
    }
  }

  handleRatingChange(event) {
    let newRating = event.target.value;
    this.setState({ rating: newRating });
  }

  handleCommentChange(event) {
    let newComment = event.target.value;
    this.setState({ comment: newComment });
  }

  handleSubmit(event) {
    event.preventDefault();
    // window.location.href
    let url = window.location.href.split("/")
    console.log(url);
    let numId = url[url.length - 1]
    console.log(numId);
    let fetchBody = { rating: this.state.rating,  comment: this.state.comment, userId: this.state.userId };
    let newReviews = [];
    fetch(`../api/v1/games/${numId}/reviews`,
      { method: "POST",
      body: JSON.stringify(fetchBody) })
      .then(function(response) {
        newReviews = response.json();
        return newReviews;
      }).then((response) => this.setState({
        reviews: response,
        rating: "",
        comment: "",
        clicked: false
      }));

  }


  componentDidMount(){
    let url = window.location.href.split("/")
    let numId = url[url.length - 1]
    let currentUserId = parseInt($('.user_id').first().attr("id"));
    console.log(`userId: ${currentUserId}`);
    $.ajax({
      method: "GET",
      url: `../api/v1/games/${numId}.json`
    })
    .done(data => {
      this.setState({
        reviews: data,
        userId: currentUserId
      });
    });
  }

  render() {
    let clicked = this.state.clicked;
    let userId = this.state.userId;
    let reviews = this.state.reviews.map(review => {
      return(
        <Review
        key={review.id}
        id={review.id}
        rating={review.rating}
        comment={review.comment}
        />
      );
    });
    return(
      <div>
        <Form
          handleSubmit={this.handleSubmit}
          handleRatingChange={this.handleRatingChange}
          handleCommentChange={this.handleCommentChange}
          handleClicked={this.handleClicked}
          clicked={clicked}
          userId={userId}
        />

        {reviews}
      </div>

    );
  }
}


export default App;
