class Picture < ActiveRecord::Base
  belongs_to :report

  has_attached_file(
    :file,
    styles: { medium: '400x400>', thumb: '100x100#' },
    path: ':class/:attachment/:id_partition/:style/:hash.:extension',
    url: ':class/:attachment/:id_partition/:style/:hash.:extension',
    hash_secret: '9494nfjwqpofkadfa9fa093e4',
    storage: :dropbox,
    dropbox_credentials: Rails.root.join('config/dropbox.yml')
  )

  validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :file, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
