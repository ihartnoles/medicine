class Cv < ActiveRecord::Base
  attr_accessible :affiliate_id, :path

   #mount the CV file uploader
   mount_uploader :cv, CvUploader
end
