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
      method_option :seed, :type => :array, :aliases => '-s', :desc => "Initial Pattern"

      def new
        seed = build_seed(options[:seed])
        max_gen = options[:generations]
        world = World.new(options[:height], options[:width] seed)

        (1..max_gen).each do |gen|
          print world.to_s("@", "_") + eol(options[:height], gen, max_gen)
          sleep(1)
          world.tick
        end
      end

      no_tasks do
        def eol(height, curr_gen, max_gen)
          curr_gen == max_gen ? "\n" : format("\e[1A" * (height-1) + "\r")
        end

        def build_seed(pattern)
          pattern.map {|pair| pair.split(":").map { |coord| coord.to_i - 1 } }
        end
      end

    end
  end
end
