class Song < ActiveRecord::Base
	# validates :file, presence: true
	validate :validate_file_name_is_unique


	private

		def validate_file_name_is_unique
			if !file.present?
				errors.add :file, "must be select."
		    elsif Song.where(:file => file.file.original_filename).count > 0
		         errors.add :file, "'#{file.file.original_filename}' already exists"
		    end
		end

	mount_uploader :file, PictureUploader

end
