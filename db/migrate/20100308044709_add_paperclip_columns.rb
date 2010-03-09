class AddPaperclipColumns < ActiveRecord::Migration
  def self.up
    remove_column :uploads, :file
    add_column :uploads, :data_file_name,    :string
    add_column :uploads, :data_content_type, :string
    add_column :uploads, :data_file_size,    :integer
    add_column :uploads, :data_updated_at,   :datetime
  end

  def self.down
    add_column :uploads, :file, :string
    remove_column :uploads, :data_file_name
    remove_column :uploads, :data_content_type
    remove_column :uploads, :data_file_size
    remove_column :uploads, :data_updated_at
  end
end
