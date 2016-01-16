class Content < ActiveRecord::Base
	belongs_to :user

	has_attached_file :cover, styles: { medium: "300x>", thumb: "100x>" }
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/,
    message: "Solo le immagini sono supportate"

    has_attached_file :allegato
	validates_attachment_content_type :allegato, :content_type => [ /^image\/(png|gif|jpeg)/,'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/mspowerpoint','application/vnd.ms-powerpoint','application/vnd.openxmlformats-officedocument.presentationml.presentation', 'application/pdf', 'application/msexcel','application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','audio/mpeg', 'audio/mp3' ],
	message: "Formato non supportato"
end
