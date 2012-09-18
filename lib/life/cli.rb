require 'thor'
require 'life'

module Life
  module CLI
    class Base < Thor
      include Thor::Actions

      default_task :help

      desc :new, "Create new game"
      method_option :width, :type => :numeric, :aliases => '-w', :desc => "Width of board", :required => true
      method_option :height, :type => :numeric,:aliases => '-h', :desc => "Height of board", :required => true
      def new
        seed = []
        while yes? "Would you like to add a live cell to the grid? [Y/n]"
          x = ask "Please enter x coordinate"
          y = ask "Please enter y coordinate"
          seed << [(x.to_i) - 1, (y.to_i) -1]
        end
        World.new options[:width], options[:height], seed
      end


    end
  end
end
