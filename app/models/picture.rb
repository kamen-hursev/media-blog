class Picture < ActiveRecord::Base
  belongs_to :report

  has_attached_file(
    :file,
    styles: { medium: '400x400>', thumb: '100x100#' },
    path: ':rails_root/public/system/:class/:attachment/:id_partition/:style/:hash_:filename',
    url: '/system/:class/:attachment/:id_partition/:style/:hash_:filename',
    hash_secret: 'HiperMegaSecretString',
    storage: :dropbox,
    dropbox_credentials: Rails.root.join('config/dropbox.yml')
  )

  validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :file, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
