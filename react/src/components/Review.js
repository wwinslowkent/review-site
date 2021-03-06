import React from 'react';

const Review = props => {
  let buttonClick = () => props.onClickFunction(props.id);

  if(props.userId === props.reviewUser) {
    if (props.revealed){
      return(
        <div>
        <br/>
        <input id="delete" className="button tiny button hollow button success" type="submit" value="Up Vote" name="Delete" onClick={props.handleUpVote}/> &#8196;&#8196;&#8196;&#8196;&#8196;&#8196; {props.username}: Gave this game {props.rating} out of 5 stars<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8196;&#8196;&#8196;{props.upVotes - props.downVotes}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8196;&#8196;&#8196;&#8196;&#8196;&#8196;&#8196;&#8196;Comment: {props.comment}<br/>
        <input id="delete" className="button tiny button hollow button alert" type="submit" value="Down Vote" name="Delete" onClick={props.handleDownVote}/>&#8196;&#8196;&#8196;&#8196;&#8196;<h9>Posted at {props.createdAt}</h9>

        <div className="col s2 offset-s5 center-align">
          <input id="delete" className="btn" type="submit" value="Delete" name="Delete" onClick={buttonClick}/>
        </div>

        <div className="row search">
              <input id="edit_review" type='submit' value="Actually, Nevermind" className="btn" onClick={buttonClick} />
            <form>
              <div className="input-field col s3">
                <input type="text" name="rating" defaultValue={props.rating} onChange={props.handleRatingChange}/>
              </div>
              <div className="input-field col s3">
                <input type="text" name="comment" defaultValue={props.comment} onChange={props.handleCommentChange}/>
              </div>
              <input id="add_review" className="btn" type="submit" value="Change Review" name="Submit" onClick={props.handleEdit}/>
            </form>
        </div>
        <hr/>
      </div>
      );
    } else {
      return(
        <div id='review'>
        <br/>
        <input id="delete" className="button tiny button hollow button success" type="submit" value="Up Vote" name="Delete" onClick={props.handleUpVote}/> &#8196;&#8196;&#8196;&#8196;&#8196;&#8196; {props.username}: Gave this game {props.rating} out of 5 stars<br/>
        <div className='small-12 columns'><div className='small-1 columns' id='thing'>&#8196;{props.upVotes - props.downVotes} </div><div className='small-11 columns' id='thing2'>&#8196;&#8196;&#8196;&#8196;&#8196;Comment: {props.comment}</div></div><br/>
        <input id="delete" className="button tiny button hollow button alert" type="submit" value="Down Vote" name="Delete" onClick={props.handleDownVote}/>&#8196;&#8196;&#8196;&#8196;&#8196;<h9>Posted at {props.createdAt}</h9>

        <div className="col s2 offset-s5 center-align">
          <input id="delete" className="btn" type="submit" value="Delete" name="Delete" onClick={props.handleDelete}/>     <input id="add-review" type='submit' value="Edit Review" className="btn" onClick={buttonClick} />
        </div>
        <br/>
      <hr/>
    </div>
    );
  }
  }
  else if(props.isAdmin) {
    return(
      <div>
      <br/>
      <input id="delete" className="button tiny button hollow button success" type="submit" value="Up Vote" name="Delete" onClick={props.handleUpVote}/> &#8196;&#8196;&#8196;&#8196;&#8196;&#8196; {props.username}: Gave this game {props.rating} out of 5 stars<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8196;&#8196;&#8196;{props.upVotes - props.downVotes}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8196;&#8196;&#8196;&#8196;&#8196;&#8196;&#8196;&#8196;Comment: {props.comment}<br/>
      <input id="delete" className="button tiny button hollow button alert" type="submit" value="Down Vote" name="Delete" onClick={props.handleDownVote}/>&#8196;&#8196;&#8196;&#8196;&#8196;<h9>Posted at {props.createdAt}</h9>

        <div className="col s2 offset-s5 center-align">
          <input id="delete" className="btn" type="submit" value="Delete" name="Delete" onClick={props.handleDelete}/>
        </div>
        <hr/>
      </div>
    );

  }
  else if(props.userId != 0 ) {
    return(
      <div>
      <br/>
      <input id="delete" className="button tiny button hollow button success" type="submit" value="Up Vote" name="Delete" onClick={props.handleUpVote}/> &#8196;&#8196;&#8196;&#8196;&#8196;&#8196; {props.username}: Gave this game {props.rating} out of 5 stars<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8196;&#8196;&#8196;{props.upVotes - props.downVotes}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8196;&#8196;&#8196;&#8196;&#8196;&#8196;&#8196;&#8196;Comment: {props.comment}<br/>
      <input id="delete" className="button tiny button hollow button alert" type="submit" value="Down Vote" name="Delete" onClick={props.handleDownVote}/>&#8196;&#8196;&#8196;&#8196;&#8196;<h9>Posted at {props.createdAt}</h9>
        <hr/>
      </div>
    );
  }
  else {
    return(
      <div>
        {props.username}: Gave this game {props.rating} out of 5 stars<br/>
        Comment: {props.comment}<br/>
        <h9>Posted at {props.createdAt}</h9>

        <hr/>
      </div>
    );
  }
};







export default Review;
