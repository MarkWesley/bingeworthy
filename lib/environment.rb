require_relative "./Bingeworthy/version"
require_relative "./Bingeworthy/cli"
require_relative "./Bingeworthy/api"
require_relative "./Bingeworthy/genres"
require_relative "./Bingeworthy/tv_shows"
require_relative "./Bingeworthy/tv_genres"
require 'pry'
require "httparty"

module Bingeworthy
  class Error < StandardError; end
  # Your code goes here...
end
