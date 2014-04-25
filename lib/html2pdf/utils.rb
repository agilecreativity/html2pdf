require 'open3'
require 'fileutils'
require_relative '../html2pdf'

module Html2Pdf
  module Utils
    class << self
      # Batch convert to pdf using `wkhtmltopdf` tool
      #
      # @param [Array<String>] files the input file list
      # @param [String] base_dir the base directory
      def to_pdfs(files)
        files.each_with_index do |file, index|
          puts "Convert file #{index + 1} of #{files.size} : #{file}"
          to_pdf(file)
        end
      end

      # Convert '*.xhtml' or '*.html' to pdf
      #
      # @param filename input filename
      def to_pdf(filename)
        # see: http://madalgo.au.dk/~jakobt/wkhtmltoxdoc/wkhtmltopdf_0.10.0_rc2-doc.html#Footers And Headers
        #  - may be only allow "*.html" and "*.xhtml"
        #  - allow the options to be passed in so that we can use different theme
        #    '--no-background'
        fail "Invalid input file #{filename}" unless File.exist?(filename)
        command = [
          'wkhtmltopdf',
          '--margin-top 4',
          '--margin-bottom 4',
          '--margin-left 4',
          '--margin-right 4',
          # Note: working correctly but long URL
          '--header-center "[webpage] :: [page]/[topage]"',
          # header section
          # TODO: not yet working properly
          # "--header-center #{filename.gsub(base_dir,File.basename(base_dir))} \"[page]/[topage]\"",
          # "--header-center #{filename} \"[page]/[topage]\"",
          '--header-spacing 1',
          '--header-font-size 8',
          '--header-line',
          # footer section
          '--footer-spacing 1',
          '--footer-font-size 8',
          '--footer-line',
          "#{filename}",
          "#{filename}.pdf",
          '> /dev/null']
        _stdin, _stderr, status = Open3.capture3(command.join(' '))
        # puts "FYI: to_pdf command: #{command.join(' ')}"
        # Note: may be log it and continue
        fail "Problem processing #{filename}" unless status.success?
      end

      # Check and verify that the proper softwares are available.
      #
      def required_softwares?
        AgileUtils::Helper.which('gs') && AgileUtils::Helper.which('gs')
      end
    end
  end
end
