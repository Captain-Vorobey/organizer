module Avatar
  extend ActiveSupport::Concern

  def profile_avatar_thumbnail
    avatar.variant(resize: '200x200!').processed if avatar.attached?
  end

  def comment_avatar_thumbnail
    avatar.variant(resize: '30x30!').processed if avatar.attached?
  end
end