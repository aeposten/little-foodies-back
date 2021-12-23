class ChildSerializer < ActiveModel::Serializer 
  include Rails.application.routes.url_helpers
  attributes :id, :first_name, :age, :image

  def image
  #   object.image.attached?  url: rails_blob_url(object.image)
  # end
    if object.image.attached?
      {
        url: rails_blob_url(object.image)
      }
    end
  end
end
