module PostsHelper
  def display_likes(post) 
    votes = post.votes_for.up.by_type(User)
    if votes.size >= 1 && votes.size <= 8 
      return list_likers(votes) 
    else 
      count_likers(votes)
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
    def list_likers(votes)
      usernames = []
      unless votes.blank?
        votes.voters.each do |voter|
          usernames.push(link_to voter.username, profile_path(voter.username), class: 'user-name')
        end
        usernames.to_sentence.html_safe + like_plural(votes)
      end
    end
    
    def count_likers(votes)
      vote_count = votes.size
      vote_count.to_s + ' likes'
    end
  
    def like_plural(votes)
      if votes.count >= 2
        return ' like this' 
      else
        return ' likes this'
      end
    end
end
