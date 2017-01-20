import React from 'react';
import App from './app';

const Review = (props) => {
  let upvoteColor = 'white';
  let downvoteColor = 'white';
  if (props.upvoted) {
    upvoteColor = 'green';
  }
  if (props.downvoted) {
    downvoteColor = 'red';
  }


  return (
    <div>
      <p>review</p>
      <h1> IS THI SSHOWING UP?A?A?A??? </h1>
      <button className={upvoteColor} type='button' onClick={event => {event.preventDefault(), props.onClickFunction('upvoted', props.index);}}> ↑</button>
      <button className={downvoteColor} type='button' onClick={event => {event.preventDefault(), props.onClickFunction('downvoted', props.index);}}> ↑</button>
      </div>
  );
};

export default Review;
