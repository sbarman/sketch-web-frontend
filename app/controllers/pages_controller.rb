class PagesController < ApplicationController
  def sketch
    @title = "Web Frontend"
  end
  def sketch1
    @title = "Web Frontend"
  end
  def result
    sketchText = params[:text][:input]
    File.open('temp.sk', 'w') {|f| f.write(sketchText) }
    output = IO.popen('sketch temp.sk') 
    lines = output.readlines
    stringLine = lines.map{|s| "'#{s}'"}.join(' ')
    @message = stringLine
  end

end
