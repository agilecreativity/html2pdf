require 'thor'
require 'tmpdir'
require 'fileutils'
require_relative '../html2pdf'
require_relative './utils'

module Html2Pdf
  include AgileUtils::Options
  include CodeLister

  class CLI < Thor
    desc 'export', 'export html files to pdfs'

    method_option *AgileUtils::Options::BASE_DIR
    method_option *AgileUtils::Options::EXTS
    method_option *AgileUtils::Options::NON_EXTS
    method_option *AgileUtils::Options::INC_WORDS
    method_option *AgileUtils::Options::EXC_WORDS
    method_option *AgileUtils::Options::IGNORE_CASE
    method_option *AgileUtils::Options::RECURSIVE
    method_option *AgileUtils::Options::VERSION
    method_option *AgileUtils::Options::THEME

    def export
      input_files = CodeLister.files base_dir: options[:base_dir],
                                     exts: %w(html xhtml),
                                     recursive: true
      puts "FYI: input files: #{input_files}"
      to_pdfs(input_files)
    end

    desc 'usage', 'Display usage information'
    def usage
      puts <<-EOT
      #{AgileUtils::Options.default_usage}
      EOT
    end

    default_task :usage

    private

    def to_pdfs(html_files)
      elapsed = AgileUtils::FileUtil.time do
        Html2Pdf::Utils.to_pdfs(html_files)
      end
      puts "Convert files to pdfs took #{elapsed} ms"
    end

  end
end
