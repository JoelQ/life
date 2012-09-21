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
      method_option :seed, :type => :array, :aliases => '-s', :desc => "Initial Pattern", :required => true

      def new
        seed = build_seed(options[:seed])
        max_gen = options[:generations]
        world = World.new(options[:height], options[:width], seed)
        display_simulation max_gen, options[:width], options[:height], world
      rescue Interrupt
        quit(options[:height])
      end

      desc :random, "Create new game with random starting pattern"
      method_option :width, :type => :numeric, :aliases => '-w', :desc => "Width of board", default: 30
      method_option :height, :type => :numeric,:aliases => '-h', :desc => "Height of board", default: 30
      method_option :generations, :type => :numeric,:aliases => '-g', :desc => "How many generations to display", default: 100

      def random
        seed = build_random_seed options[:width], options[:height]
        max_gen = options[:generations]
        world = World.new(options[:height], options[:width], seed)
        display_simulation max_gen, options[:width], options[:height], world
      rescue Interrupt
        quit(options[:height])
      end

      no_tasks do
        def eol(height, curr_gen, max_gen)
          curr_gen == max_gen ? "\n" : format("\e[1A" * (height+3) + "\r")
        end

        def quit(height)
          puts ("\n"*(height+3))
          puts "Exiting..."
          puts "Thanks for trying out Conway's game of life!"
        end

        def build_seed(pattern)
          pattern.map {|pair| pair.split(":").map { |coord| coord.to_i - 1 } }
        end

        def build_random_seed(width, height)
          seed = []
          seed_count = rand(1..(width*height/2))
          seed_count.times do
            seed << [rand(height-1), rand(width-1)]
          end
          seed
        end

        def display_simulation(max_gen, width, height, world)
          (1..max_gen).each do |gen|
            world_data = "==============\nGeneration:#{gen}/#{max_gen}\nWidth:#{width}\nHeight: #{height}\n"
            print world_data + world.to_s("@", " ") + eol(height, gen, max_gen)
            sleep(0.1)
            world.tick
          end
        end
      end

    end
  end
end
