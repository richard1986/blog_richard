class CrashesController < ApplicationController
	layout "backend"
    #render 404 error 
    def when_render_not_found
      respond_to do |f| 
        f.html{ render :template => 'crashes/404', :status => 404 }
        f.any{ render :template => 'crashes/ajax_404', :status => 404 }
      end
    end

end
