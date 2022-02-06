module ApplicationHelper
  def current_year 
    Time.current.year.to_s + ' year'
  end 
  
  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}"
  end 
end
