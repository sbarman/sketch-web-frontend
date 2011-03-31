require "tempfile"
require "open3"

class PagesController < ApplicationController
  def sketch
    @title = "Web Frontend"
  end
  def sketch1
    @title = "Web Frontend"
  end
  def result
    sketchText = params[:text][:input]
    if File::directory?("~/.sketch")
      Dir.mkdir("~/.sketch")
    end
    f = Tempfile.new("temp.sk")
    f.chmod(0755)
    f.write(sketchText)
    f.close

    stdin, stdout, stderr = Open3.popen3('sketch ' + f.path) 
    lines = stdout.readlines
    stringLine = lines.map{|s| "'#{s}'"}.join(' ')
    lines = stderr.readlines
    stringLine += lines.map{|s| "'#{s}'"}.join(' ')

    @message = stringLine
  end

end
