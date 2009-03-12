module FileContentTags
  include Radiant::Taggable

  desc %{
    Adds content of selected file. It takes only one attribute: @path@, with
    absolute path to the file

    *Usage:*

    <pre><code><r:file_content path='/home/http/radiant/file.txt' /></code></pre>
  }
  tag 'file_content' do |tag|
    begin
      File.read(tag.attr['path'])
    rescue => msg
      logger.warn(
        "\033[1;31mFileContentExtension: Can't open file '#{tag.attr['path']}, error: #{msg.to_s}'\033[0m"
      )
      ""
    end
  end
  
end