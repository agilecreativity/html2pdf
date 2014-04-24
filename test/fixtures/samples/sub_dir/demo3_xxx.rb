# file: spec/fixtures/sub-dir/demo3.xxx.rb
# from: https://github.com/radar/guides/blob/master/gem-development/foodie/lib/foodie/generators/recipe.rb
require 'thor/group'
module Foodie
  module Generators
    class Recipe < Thor::Group
      argument :group, :type => :string
      argument :name, :type => :string
      include Thor::Actions

      def self.source_root
        File.dirname(__FILE__) + "/recipe"
      end

      def create_group
        empty_directory(group)
      end

      def copy_recipe
        template("recipe.txt", "#{group}/#{name}.txt")
      end
    end
  end
en
