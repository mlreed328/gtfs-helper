require 'fileutils' 

class Upload < ActiveRecord::Base
  
  has_attached_file :data
  
  def reset_tmp_dir
    FileUtils.rm_r "#{Rails.root}/tmp/gtfs" if File.exist?("#{Rails.root}/tmp/gtfs")
    FileUtils.mkdir "#{Rails.root}/tmp/gtfs"
  end
  
  # Override Paperclip's setter method http://pastie.org/310107
  def data=(file)
    extract_files(file)
    attachment_for(:data).assign(file)
  end

  def extract_files(file)
    reset_tmp_dir
    `cp #{file.path} #{Rails.root}/tmp/gtfs/#{file.original_filename}`
    puts "Created file: #{Rails.root}/tmp/gtfs/#{file.original_filename}"
    `cd #{Rails.root}/tmp/gtfs && unzip #{Rails.root}/tmp/gtfs/#{file.original_filename}`
    puts "Directory contents:"
    `ls #{Rails.root}/tmp/gtfs`
    # TODO rm -rf __MAC_OSX tmp dir
    # TODO could delete all non .txt files
  end
  
  
end