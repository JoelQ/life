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
        seed = []
        while yes? "Would you like to add a live cell to the grid? [Y/n]"
          x = ask "Please enter x coordinate"
          y = ask "Please enter y coordinate"
          seed << [(x.to_i) - 1, (y.to_i) -1]
        end

        world = World.new options[:width], options[:height], seed

        (1..options[:generations]).each do |gen|
          puts "== Generation #{gen} =="
          draw(world)
          puts ""
          world.tick
        end
      end

      def draw(world)
        world.current.each do |row|
          processed_row = row.map { |cell| cell.live? ? "@" : "_"}
          print "["
          print processed_row.join(' ')
          puts "]"
        end
      end

    end
  end
end
