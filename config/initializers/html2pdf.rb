require_relative "../../lib/html2pdf/configuration"
module Html2Pdf
  class << self
    # Customize the configuration for specific system (Ubuntu/OSX/etc)
    # See: ./lib/html2pdf/configuration.rb for available options
    # rubocop:disable MethodLength
    def update_config
      Html2Pdf.configure do |config|
        # Note: or add your own path here if `wkhtmltopdf` is not in the $PATH environment
        config.options[:wkhtmltopdf]   = (defined?(Bundler::GemfileError) ? `bundle exec which wkhtmltopdf` : `which wkhtmltopdf`).chomp
        config.options[:page_settings] = [
          "--margin-top 8",
          "--margin-bottom 8",
          "--margin-left 8",
          "--margin-right 8",
          '--header-center "[webpage] :: [page]/[topage]"',
          "--header-spacing 1",
          "--header-font-size 8",
          "--header-line",
          "--footer-spacing 1",
          "--footer-font-size 8",
          "--footer-line"
        ]
      end
    end
    # rubocop:enable All
  end
end
