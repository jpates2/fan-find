class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user
      redirect_to matches_path(@matches)
    end
    set_meta_tags title: 'Home',
    description: 'Watch upcoming FIFA World Cup matches with like-minded fans who support your team.
    Find events near you or create your own.',
    keywords: 'world cup, FIFA, matches, fans, soccer, football,
    soccer fans, football fans, events, meet up, find fans,
    team, football team',
    og: {
      description: 'Team up to watch the FIFA World Cup. Find events near you or create your own,
      chat with other fans, and share posts.',
      type: 'mobile app',
      url: 'www.fan-find.com',
      image: 'metatag-photo.png'
    }
  end
end
