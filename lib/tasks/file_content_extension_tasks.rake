namespace :radiant do
  namespace :extensions do
    namespace :file_content do
      
      desc "Runs the migration of the File Content extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          FileContentExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          FileContentExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the File Content to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from FileContentExtension"
        Dir[FileContentExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(FileContentExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
