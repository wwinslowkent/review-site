import React from 'react';

const Review = props => {

  let buttonClick = () => props.onClickFunction(props.id);

  if(props.userId === props.reviewUser) {
    if (props.revealed){
      return(
        <div>
        {props.username}: Gave this game {props.rating} out of 5 stars<br/>
        Comment: {props.comment}<br/>
        <h9>Posted at {props.createdAt}</h9>
        <div className="col s2 offset-s5 center-align">
          <input id="delete" className="btn" type="submit" value="Delete" name="Delete" onClick={buttonClick}/>
        </div>

        <div className="row search">
            <input id="edit_review" type='submit' value="Actually, Nevermind" className="btn" onClick={buttonClick} />
            <form>
              <div className="input-field col s3">
                <input type="text" name="rating" onChange={props.handleRatingChange}/>
              </div>
              <div className="input-field col s3">
                <input type="text" name="comment" onChange={props.handleCommentChange}/>
              </div>
              <div className="row">
                <div className="col s2 offset-s5 center-align">
                  <input id="add_review" className="btn" type="submit" value="Change Review" name="Submit" onClick={props.handleEdit}/>
                </div>
              </div>
            </form>
        </div>
        <hr/>
      </div>
      );
    } else {
      return(
        <div>
        {props.username}: Gave this game {props.rating} out of 5 stars<br/>
        Comment: {props.comment}<br/>
        <h9>Posted at {props.createdAt}</h9>
        <div className="col s2 offset-s5 center-align">
          <input id="delete" className="btn" type="submit" value="Delete" name="Delete" onClick={props.handleDelete}/>
        </div>
      <div className="row search">
        <input id="add-review" type='submit' value="Edit Review" className="btn" onClick={buttonClick} />
      </div>
      <hr/>
    </div>
    );
  }
  }
  else if(props.isAdmin) {
    return(
      <div>
        {props.username}: Gave this game {props.rating} out of 5 stars<br/>
        Comment: {props.comment}<br/>
        <h9>Posted at {props.createdAt}</h9>
        <div className="col s2 offset-s5 center-align">
          <input id="delete" className="btn" type="submit" value="Delete" name="Delete" onClick={props.handleDelete}/>
        </div>
        <hr/>
      </div>
    );

  }
  else {
    return(
      <div>
        {props.username}: Gave this game {props.rating} out of 5 stars<br/>
        Comment: {props.comment}
        <h9>Posted at {props.createdAt}</h9>

        <hr/>
      </div>
    );
  }
};







export default Review;
