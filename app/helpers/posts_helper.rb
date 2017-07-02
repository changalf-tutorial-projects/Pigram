module PostsHelper
  def likers_of(post)
    votes = post.votes_for.up.by_type(User)
    usernames = []
    unless votes.blank?
      votes.voters.each do |voter|
        usernames.push(link_to voter.username, profile_path(voter.username), class: 'user-name')
      end
      usernames.to_sentence.html_safe + like_plural(votes)
    end
  end
  
  def liked_post(post)
    if current_user.voted_for? post
      return 'glyphicon-heart'
    else
      return 'glyphicon-heart-empty'
    end
  end
  
  private
    def like_plural(votes)
      if votes.count >= 2
        return ' like this' 
      else
        return ' likes this'
      end
    end
end
