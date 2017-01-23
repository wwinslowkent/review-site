import React from 'react';

const Form = props => {
 if (props.clicked){
   return(
     <div className="row search">
         <input id="add_review" type='submit' value="Actually, Nevermind" className="btn" onClick={event => {event.preventDefault(), props.handleClicked();}} />
         <form>
           <div className="input-field col s3">
             <input type="text" name="rating" placeholder="Enter rating here..." onChange={props.handleRatingChange}/>
           </div>
           <div className="input-field col s3">
             <input type="text" name="comment" placeholder="Enter comment here..." onChange={props.handleCommentChange}/>
           </div>
           <input type="hidden"  name="userId" value={props.userId} />
           <div className="row">
             <div className="col s2 offset-s5 center-align">
               <input id="add_review" className="btn" type="submit" value="Add Review" name="Submit" onClick={props.handleSubmit}/>
             </div>
           </div>
         </form>
     </div>
   );
 } else {
   return(
   <div className="row search">
     <input id="add-review" type='submit' value="Add New Review" className="btn" onClick={event => {event.preventDefault(), props.handleClicked();}} />
   </div>
 );}
};

export default Form;
