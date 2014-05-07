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
        fail "Invalid input file #{filename}" unless File.exist?(filename)
        command = [
          'wkhtmltopdf',
          '--margin-top 4',
          '--margin-bottom 4',
          '--margin-left 4',
          '--margin-right 4',
          '--header-center "[webpage] :: [page]/[topage]"',
          '--header-spacing 1',
          '--header-font-size 8',
          '--header-line',
          '--footer-spacing 1',
          '--footer-font-size 8',
          '--footer-line',
          "#{filename}",
          "#{filename}.pdf",
          '> /dev/null']
        _stdin, _stderr, status = Open3.capture3(command.join(' '))
        fail "Problem processing #{filename}" unless status.success?
      end

      # Check and verify that the proper softwares are available.
      #
      def softwares_installed?
        AgileUtils::Helper.which('wkhtmltopdf')
      end
    end
  end
end
