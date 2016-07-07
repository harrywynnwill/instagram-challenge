class Picture < ActiveRecord::Base
  extend WithUserAssociationExtension

  has_many :likes, -> {extending WithUserAssociationExtension}
  has_many :comments,-> {extending WithUserAssociationExtension},
           dependent: :destroy
  belongs_to :user

  has_attached_file :image,
  styles: { thumb: '300x300>' },
  storage: :s3,
  s3_credentials: {
    bucket: 'instassism',
    s3_region: 'us-west-2',
    access_key_id: Rails.application.secrets.s3_access_key,
    secret_access_key: Rails.application.secrets.s3_secret_key
  }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image
end
