

<% if @reviews != [] %>
<h2>Reviews:</h2>
  <% @reviews.each do |review| %>
    <h4>
      <% if review.user %>
        <%= review.user.name %>
      <% else %>
        [ <i>User Deleted</i> ]
      <% end %>gave this game <%= review.rating %> out of 5 stars
      <br />
      <% if review.comment %>
        Comment: <%= review.comment %>
      <% end %>
      <% if admin_signed_in? || (current_user && (current_user.id == review.user.id))%>
        <%= button_to 'Delete Review', polymorphic_url([@game, review]), method: :delete %>
      <% end %>
    </h4>
  <% end %>
<% end %>
