module Html2Pdf
  class Configuration
    attr_accessor :options
    # rubocop:disable MethodLength
    def initialize
      # see: http://wkhtmltopdf.org/usage/wkhtmltopdf.txt
      @options = {
        wkhtmltopdf: (defined?(Bundler::GemfileError) ? `bundle exec which wkhtmltopdf` : `which wkhtmltopdf`).chomp,
        page_settings: [
          "--margin-top 4",
          "--margin-bottom 4",
          "--margin-left 4",
          "--margin-right 4",
          '--header-center "[webpage] :: [page]/[topage]"',
          "--header-spacing 1",
          "--header-font-size 8",
          "--header-line",
          "--footer-spacing 1",
          "--footer-font-size 8",
          "--footer-line"
        ]
      }
    end
    # rubocop:enable All
  end

  class << self
    attr_accessor :configuration

    # Configure Pdfs2Pdf someplace sensible, like
    # config/initializers/html2pdf.rb
    #
    # Html2Pdf.configure do |config|
    #   # set appropriate options
    #   config.options[:wkhtmltopdf]   = '/usr/bin/wkhtmltopdf'
    #   config.options[:page_settings] = [ "--margin-top 4",
    #                                      "--margin-bottom 4",
    #                                      ..
    #                                    ]
    # end
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
