class Resume < ActiveRecord::Base
   belongs_to :issue
   belongs_to :user
   
   mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
   validates :name, presence: true 
   validates :attachment, presence: true
end