class ChildSerializer < ActiveModel::Serializer 
  attributes :id, :first_name, :age, :image
  include Rails.application.routes.url_helpers

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
