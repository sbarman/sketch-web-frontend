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
    @title = "Sketch Output"

    sketchText = params[:text][:input]

    f = File.open("temp.sk", "w")
    f.chmod(0755)
    f.write(sketchText)
    f.close

    stdin, stdout_and_stderr, thr  = Open3.popen2e('sketch ' + f.path) 
    lines = stdout_and_stderr.readlines
    stringLine = lines.map{|s| "#{s}"}.join('')
    stdout_and_stderr.close

    @message = stringLine
  end

end
