require 'thor'
require 'tmpdir'
require 'fileutils'
require_relative '../html2pdf'
module Html2Pdf
  class CLI < Thor
    desc 'export', 'export html files to pdfs'

    method_option *AgileUtils::Options::BASE_DIR
    method_option *AgileUtils::Options::INC_WORDS
    method_option *AgileUtils::Options::EXC_WORDS
    method_option *AgileUtils::Options::IGNORE_CASE
    method_option *AgileUtils::Options::RECURSIVE
    method_option *AgileUtils::Options::VERSION

    def export
      unless Html2Pdf::Utils.required_softwares?
        fail 'You must have valid `wkhtmltopdf` and `ghostscript` installation'
      end

      input_files = CodeLister.files base_dir: options[:base_dir],
                                     exts: %w(html xhtml),
                                     recursive: true
      elapsed = AgileUtils::FileUtil.time do
        Html2Pdf::Utils.to_pdfs(input_files)
      end
      puts "Convert files to pdfs took #{elapsed} ms"
    end

    desc 'usage', 'Display usage information'
    def usage
      puts <<-EOT
Usage:
  html2pdf export [OPTIONS]

Options:
  -b, [--base-dir=BASE_DIR]                # Base directory
                                           # Default: /Users/agilecreativity/codes/github/html2pdf
  -n, [--inc-words=one two three]          # List of words to be included in the result
  -x, [--exc-words=one two three]          # List of words to be excluded from the result
  -i, [--ignore-case], [--no-ignore-case]  # Match case insensitively
                                           # Default: true
  -r, [--recursive], [--no-recursive]      # Search for files recursively
                                           # Default: true
  -v, [--version], [--no-version]          # Display version information

export html files to pdfs
      EOT
    end

    default_task :usage
  end
end
