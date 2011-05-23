require "tempfile"
require "open3"

class PagesController < ApplicationController
    layout "application", :except => [:result_async]

    def sketch
        @title = "Web Frontend"
    end

    def sketchexp
        @title = "Web Frontend"
    end
  
    def result
        @title = "Sketch Output"

        sketchText = params[:sketchtext]
        sketchTempDir = "sketchtemp/"

        time = Time.now
        fileName = time.strftime("%Y-%m-%d-%H:%M:%S.sk")

        f = File.open(sketchTempDir + fileName, "w")
        f.chmod(0755)
        f.write(sketchText)
        f.close

	logger.info f.path

        stdin, stdout_and_stderr, thr  = Open3.popen2e('script/run-sketch.sh ' + f.path) 
        lines = stdout_and_stderr.readlines
        stringLine = lines.map{|s| "#{s}"}.join('')
        stdout_and_stderr.close
	
	if request.xhr?
            render :text => stringLine
	else
            @message = stringLine
   	end
    end
end
