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
      user: null,
      commentUsers: [],
      isAdmin: false

    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleRatingChange = this.handleRatingChange.bind(this);
    this.handleCommentChange = this.handleCommentChange.bind(this);
    this.handleClicked = this.handleClicked.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
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
    let url = window.location.href.split("/");
    let numId = url[url.length - 1];
    let fetchBody = { rating: this.state.rating,  comment: this.state.comment, userId: this.state.user.id };
    let newReviews = [];
    let newUserArr = this.state.commentUsers;
    newUserArr.push(this.state.user);
    fetch(`../api/v1/games/${numId}/reviews`,
      { method: "POST",
      body: JSON.stringify(fetchBody) })
      .then(function(response) {
        newReviews = response.json();
        return newReviews;
      }).then((response) =>
      this.setState({
        reviews: response,
        rating: "",
        comment: "",
        clicked: false,
        commentUsers: newUserArr
      })
  );
  }

  handleDelete(reviewId){
    let fetchBody = { id: reviewId }
    let newReviews = []
    let url = window.location.href.split("/");
    let numId = url[url.length - 1];
    fetch(`/api/v1/games/${numId}/reviews/${reviewId}`,
    { method: "DELETE",
    body: JSON.stringify(fetchBody)
  }).then(function(response){
    newReviews = response.json()
    return newReviews
  }).then((response) => this.setState({ reviews: response }))
  }


  componentDidMount(){
    let url = window.location.href.split("/");
    let numId = url[url.length - 1];
    $.ajax({
      credentials: 'same-origin',
      method: "GET",
      url: `../api/v1/games/${numId}.json`
    })
    .done(data => {
      this.setState({
        reviews: data.reviews,
        user: data.user,
        commentUsers: data.commentUsers,
        isAdmin: data.isAdmin
      });
    });
  }

  render() {
    let clicked = this.state.clicked;
    let currentUser = this.state.user;
    let userName;
    let userId;
    let counter = -1;
    let reviewUsers = this.state.commentUsers;
    let isAdmin = this.state.isAdmin;

    if (this.state.user !== null) {
      userId = this.state.user.id;
      userName = this.state.user.name;
    }
    else {
      userId = 0;
      userName = "test";
    }
    let reviews = this.state.reviews.map(review => {
      let handleDelete = () => {
        this.handleDelete(review.id)
      }
      counter++;
      if (counter >=  reviewUsers.length) {
        return(
          <Review
          key={review.id}
          id={review.id}
          rating={review.rating}
          comment={review.comment}
          username={currentUser.name}
          reviewUser={review.user_id}
          isAdmin={isAdmin}
          userId ={userId}
          handleDelete={handleDelete}
          />
        );
      }
      else {
        return(
          <Review
          key={review.id}
          id={review.id}
          rating={review.rating}
          comment={review.comment}
          username={reviewUsers[counter].name}
          reviewUser={review.user_id}
          isAdmin={isAdmin}
          userId ={userId}
          handleDelete={handleDelete}
          />
        );
      }
    });
    if (this.state.user !== null) {
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
      else {
        return (
        <div>
          {reviews}
          </div>
        );
      }




  }
}


export default App;
