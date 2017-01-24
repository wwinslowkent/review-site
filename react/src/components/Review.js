import React from 'react';

const Review = props => {
  if(props.userId === props.reviewUser) {
    return(
      <div>
        {props.username}: Gave this game {props.rating} out of 5 stars<br/>
        Comment: {props.comment}
        <div className="col s2 offset-s5 center-align">
          <input id="delete" className="btn" type="submit" value="Delete" name="Delete" onClick={props.handleDelete}/>
        </div>
          <h1> edit goes here </h1>
        <hr/>
      </div>
    );
  }
  else if(props.isAdmin) {
    return(
      <div>
        {props.username}: Gave this game {props.rating} out of 5 stars<br/>
        Comment: {props.comment}
          <h1> delete goes here </h1>
        <hr/>
      </div>
    );

  }
  else {
    return(
      <div>
        {props.username}: Gave this game {props.rating} out of 5 stars<br/>
        Comment: {props.comment}
        <h1> this is poop </h1>
        <hr/>
      </div>
    );
  }
};







export default Review;
