class FileContentExtension < Radiant::Extension
  version "0.1"
  description "Adds tag <r:file_content> for inserting contents of files"
  url "http://github.com/astashov/radiant-file-content-extension/tree/master"
  
  def activate
    Page.send :include, FileContentTags
  end
  
  def deactivate
  end
  
end
