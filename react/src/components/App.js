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
      isAdmin: false,
      revealedKey: null

    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleRatingChange = this.handleRatingChange.bind(this);
    this.handleCommentChange = this.handleCommentChange.bind(this);
    this.handleClicked = this.handleClicked.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
    this.handleEditClicked = this.handleEditClicked.bind(this);
    this.parseTime = this.parseTime.bind(this);
    this.handleUpVote = this.handleUpVote.bind(this);
    this.handleDownVote = this.handleDownVote.bind(this);
  }

  parseTime(time) {

    let firstSplit = time.split("-");
    let year = firstSplit[0];
    let month = firstSplit[1];
    let rest = firstSplit[2].split("T");
    let day = rest[0];
    let hms = rest[1].split(":");
    let hour = hms[0];
    let minute = hms[1];

    if (hour < 5) {
      hour = hour + 19;
    }
    else {
      hour = hour - 5;
    }
    let ampm = "";
    if (hour > 12) {
      hour = hour - 12;
      ampm = "PM";
    }
    else {
      ampm = "AM";
    }
    let returnString = `${hour}:${minute}${ampm}, ${month}/${day}/${year}`;
    return returnString;

  }


  handleEditClicked(reviewId) {
    if (reviewId != this.state.revealedKey) {
      this.setState({revealedKey: reviewId});
    } else {
      this.setState({revealedKey: null});
    }
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

  handleEdit(reviewId) {
    let pageId = parseInt(document.getElementById('app').dataset.id);
    event.preventDefault();

    let fetchBody = { rating: this.state.rating,  comment: this.state.comment, id: reviewId, type: "update" };
    let newReviews = [];
    fetch(`../api/v1/games/${pageId}/reviews/${reviewId}`,
      { method: "PATCH",
      body: JSON.stringify(fetchBody) })
      .then(function(response) {
        newReviews = response.json();
        return newReviews;
      }).then((response) =>
      this.setState({
        reviews: response,
        rating: "",
        comment: "",
        editReview: false
      })
    );
  }

  handleUpVote(reviewId) {
    let pageId = parseInt(document.getElementById('app').dataset.id);
    event.preventDefault();
    let fetchBody = { id: reviewId, type: "upvote" };
    let newReviews = [];
    fetch(`../api/v1/games/${pageId}/reviews/${reviewId}`,
      { method: "PATCH",
      body: JSON.stringify(fetchBody) })
      .then(function(response) {
        newReviews = response.json();
        return newReviews;
      }).then((response) =>
      this.setState({
        reviews: response,
        rating: "",
        comment: "",
        editReview: false
      })
    );
  }

  handleDownVote(reviewId) {
    let pageId = parseInt(document.getElementById('app').dataset.id);
    event.preventDefault();
    let fetchBody = { id: reviewId, type: "downvote" };
    let newReviews = [];
    fetch(`../api/v1/games/${pageId}/reviews/${reviewId}`,
      { method: "PATCH",
      body: JSON.stringify(fetchBody) })
      .then(function(response) {

        newReviews = response.json();
        return newReviews;
      }).then((response) =>
      this.setState({
        reviews: response,
        rating: "",
        comment: "",
        editReview: false
      })
    );
  }

  handleSubmit(event) {
    let pageId = parseInt(document.getElementById('app').dataset.id);
    event.preventDefault();
    let fetchBody = { rating: this.state.rating,  comment: this.state.comment, userId: this.state.user.id };
    let newReviews = [];
    let newUserArr = this.state.commentUsers;
    newUserArr.push(this.state.user);
    fetch(`../api/v1/games/${pageId}/reviews`,
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
    let fetchBody = { id: reviewId };
    let newReviews = [];
    let pageId = parseInt(document.getElementById('app').dataset.id);
    fetch(`/api/v1/games/${pageId}/reviews/${reviewId}`,
    { method: "DELETE",
    body: JSON.stringify(fetchBody)
  }).then(function(response){
    newReviews = response.json();
    return newReviews;
  })
  .then((response) => this.setState({ reviews: response }));
  }

  componentDidMount(){
    let pageId = parseInt(document.getElementById('app').dataset.id);
    $.ajax({
      credentials: 'same-origin',
      method: "GET",
      url: `../api/v1/games/${pageId}.json`
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
    let revealedKey = this.state.revealedKey;
    let revealedEdit;


    if (this.state.user !== null) {
      userId = this.state.user.id;
      userName = this.state.user.name;
    }
    else {
      userId = 0;
      userName = "test";
    }
    let reviews = this.state.reviews.map(review => {
      let createdAt = this.parseTime(review.created_at);
      if (review.id == revealedKey) {
        revealedEdit = true;
      }
      else {
        revealedEdit = false;
      }
      let handleUpVote = () => {
        this.handleUpVote(review.id);
      };

      let handleDownVote = () => {
        this.handleDownVote(review.id);
      };

      let handleDelete = () => {
        this.handleDelete(review.id);
      };

      let handleEdit = () => {
        this.handleEdit(review.id);
      };
      counter++;
      let reviewUserHolder;

      if (counter >=  reviewUsers.length) {
        reviewUserHolder = review.user_id;
      }
      else {
        reviewUserHolder = reviewUsers[counter].name;
      }
        return(
          <Review
          key={review.id}
          id={review.id}
          rating={review.rating}
          comment={review.comment}
          username={reviewUserHolder}
          reviewUser={review.user_id}
          isAdmin={isAdmin}
          userId ={userId}
          handleDelete={handleDelete}
          handleEdit={handleEdit}
          handleRatingChange={this.handleRatingChange}
          handleCommentChange={this.handleCommentChange}
          onClickFunction={this.handleEditClicked}
          revealed={revealedEdit}
          createdAt={createdAt}
          handleUpVote={handleUpVote}
          handleDownVote={handleDownVote}
          upVotes={review.up_votes}
          downVotes={review.down_votes}


          />
        );
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
        <hr/>
        {reviews}

        </div>
        );
      }
      else {
        return (
        <div>
        <hr/>
          {reviews}
        </div>
        );
      }




  }
}


export default App;
