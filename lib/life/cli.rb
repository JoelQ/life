require 'thor'

module Life
  module CLI
    class Base < Thor
      include Thor::Actions

      desc "foo", "prints foo"
      def foo
        puts "foo"
      end
    end
  end
end
