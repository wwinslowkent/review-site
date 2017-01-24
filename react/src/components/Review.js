import React from 'react';

const Review = props => {
  return(
    <div>
    {props.username}: Gave this game {props.rating} out of 5 stars<br/>
    Comment: {props.comment}
    <hr/>
    </div>
  );
};







export default Review;
