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
      method_option :generations, :type => :numeric,:aliases => '-g', :desc => "How many generations to display", :required => true

      def new
        max_gen = options[:generations]
        world = build_world(options[:width], options[:height])

        (1..max_gen).each do |gen|
          print world.to_s("@", "_") + eol(options[:height], gen, max_gen)
          sleep(1)
          world.tick
        end
      end

      def eol(height, curr_gen, max_gen)
        curr_gen == max_gen ? "\n" : format("\e[1A" * height + "\r")
      end

      def build_world(width, height)
        seed = []
        while yes? "Would you like to add a live cell to the grid? [Y/n]"
          x = ask "Please enter x coordinate"
          y = ask "Please enter y coordinate"
          seed << [(x.to_i) - 1, (y.to_i) -1]
        end
        World.new width, height, seed
      end

    end
  end
end
