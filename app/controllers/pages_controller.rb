require "tempfile"

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
    f.write(sketchText)
    f.close

    output = IO.popen('sketch ' + f.path) 
    lines = output.readlines
    stringLine = lines.map{|s| "'#{s}'"}.join(' ')
    @message = stringLine
  end

end
