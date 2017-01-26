import React from 'react';

const Form = props => {
 if (props.clicked){
   return(
     <div className="row search">
         <input id="add_review" type='submit' value="Actually, Nevermind" className="btn" onClick={event => {event.preventDefault(), props.handleClicked();}} /><br/>
         <form>
           <div className="input-field col s3">
             <input type="text" name="rating" placeholder="Enter rating here...(must be between 1 and 5)" onChange={props.handleRatingChange}/>
           </div>
           <div className="input-field col s3">
             <input type="text" name="comment" placeholder="Enter comment here...(optional)" onChange={props.handleCommentChange}/>
           </div>
           <input type="hidden"  name="userId" value={props.userId} />

               <input id="add_review" className="btn" type="submit" value="Add Review" name="Submit" onClick={props.handleSubmit}/>
             
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
