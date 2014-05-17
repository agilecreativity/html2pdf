require "thor"
require "tmpdir"
require "fileutils"
require_relative "../html2pdf"
module Html2Pdf
  class CLI < Thor
    desc "export", "export multiple html files to pdfs"
    method_option *AgileUtils::Options::BASE_DIR
    method_option *AgileUtils::Options::RECURSIVE
    method_option *AgileUtils::Options::VERSION
    def export
      opts = options.symbolize_keys

      unless Html2Pdf.softwares_installed?
        fail "You must have valid `wkhtmltopdf` installation"
      end

      if opts[:version]
        puts "You are using Html2Pdf version #{Html2Pdf::VERSION}"
        exit
      end

      input_files = CodeLister.files base_dir: opts[:base_dir],
                                     exts: %w[html xhtml],
                                     recursive: true
      elapsed = AgileUtils::FileUtil.time do
        Html2Pdf.to_pdfs(input_files)
      end

      generated_files = AgileUtils::FileUtil.add_suffix(input_files, "pdf")
      AgileUtils::FileUtil.tar_gzip_files(generated_files, "html2pdf-output.tar.gz")
      AgileUtils::FileUtil.delete(generated_files)

      puts "Convert files to pdfs took #{elapsed} ms"
      puts "Your final output is #{File.absolute_path("html2pdf-output.tar.gz")}"
    end

    desc "usage", "Display usage information"
    def usage
      puts <<-EOT
Usage:
  html2pdf

Options:
  -b, [--base-dir=BASE_DIR]                # Base directory
                                           # Default: . (current directory)
  -r, [--recursive], [--no-recursive]      # Search for files recursively
                                           # Default: true
  -v, [--version], [--no-version]          # Display version information

export multiple html files to pdfs
      EOT
    end

    default_task :usage
  end
end
