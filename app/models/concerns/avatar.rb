module Avatar
  extend ActiveSupport::Concern

  def avatar_thumbnail
    avatar.variant(resize: '150x150!').processed if avatar.attached?
  end
end