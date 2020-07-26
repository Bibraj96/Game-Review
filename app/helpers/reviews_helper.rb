module ReviewsHelper
  def display_header(review)
    if params[:game_id]
        content_tag(:h1, "Add a Review for #{review.game.title}")
    else
      content_tag(:h1, "Create a review")
    end
  end
end
