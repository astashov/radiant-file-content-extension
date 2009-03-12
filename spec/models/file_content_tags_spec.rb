require File.dirname(__FILE__) + '/../spec_helper'

describe FileContentTags do
  
  before do
    @page = Page.create!(
      :title => 'New Page',
      :slug => 'page',
      :breadcrumb => 'New Page',
      :status_id => '100'
    )
  end
  
  it "should insert file" do
    root = File.expand_path(File.dirname(__FILE__) + "../../../../../../tmp")
    begin
      File.open(root + '/file_content.txt', 'w') do |f|
        f.puts 'Content of file'
      end
      @page.should render(
        "<r:file_content path='#{root}/file_content.txt' />"
      ).as("Content of file\n")
    ensure
      FileUtils.remove_file(root + '/file_content.txt')
    end
  end
  
  it "should insert nothing if file does not exist" do
    @page.should render(
      "<r:file_content path='file_conent.txt' />"
    ).as('')
  end
  
end