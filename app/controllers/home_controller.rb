class HomeController < ApplicationController

  def index
  end

  def compile
    text = params[:text]

    dir_id = "#{request.remote_addr.gsub('.', ':')}-#{Time.now.to_i}"
    path = Rails.root.join('tmp', 'compile_files', dir_id)
    Dir.mkdir path

    file_path = File.join(path, 'TestClass.java')

    File.open(file_path, 'w') { |f| f.write text }

    Open3.popen3("javac #{file_path}") do |stdin, stdout, stderr, thread|
      @out = stdout.read
      @error = stderr.read
      @error.gsub!(path.to_s, '')
    end

    if @error.empty?
      Open3.popen3("javap -c #{path}/TestClass.class") do |stdin, stdout, stderr, thread|
        @bytecode = stdout.read
        puts stderr.read
      end
    end

  end

end
