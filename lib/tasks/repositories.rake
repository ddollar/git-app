namespace :repositories do

  desc 'Pack the sample repositories'
  task :pack do
    Dir.chdir(File.join(Rails.root, 'repositories')) do
      Dir['*'].each do |file|
        if File.directory?(file)
          puts "packing: #{file}"
          %x( tar czf #{file}.tgz #{file} )
        end
      end
    end
  end

  desc 'Unpack the sample repositories'
  task :unpack do
    Dir.chdir(File.join(Rails.root, 'repositories')) do
      Dir['*.tgz'].each do |file|
        puts "unpacking: #{file}"
        %x( tar xzf #{file} )
      end
    end
  end
  
end