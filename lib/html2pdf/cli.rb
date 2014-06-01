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

      # Always expand path so that the '.' or '~' will work if specified
      base_dir = File.expand_path(opts[:base_dir])
      input_files = CodeLister.files base_dir: base_dir,
                                     exts: %w[html xhtml],
                                     recursive: opts[:recursive]
      elapsed = AgileUtils::FileUtil.time do
        # Change the directory to the base diretory as the input_files is always
        # start with '.' relative to the base_dir
        FileUtils.cd(base_dir)
        Html2Pdf.to_pdfs(input_files)
      end
      generated_files = add_suffix(input_files, "pdf")
      output_file = "html2pdf_#{File.basename(File.expand_path(base_dir))}.tar.gz"
      AgileUtils::FileUtil.tar_gzip_files(generated_files, output_file)
      AgileUtils::FileUtil.delete(generated_files)
      puts "Convert files to pdfs took #{elapsed} ms"
      puts "Your final output is '#{File.absolute_path(output_file)}'"
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
                                           # Default: --recursive
  -v, [--version], [--no-version]          # Display version information

export multiple html files to pdfs
      EOT
    end

    default_task :usage

  private

    # Add suffix to each extensions
    #
    # @param [Array<String>] extensions list of extension
    # @param [String] suffix the suffix string
    #
    # @return [Array<String>] new list with the suffix added to each element
    def add_suffix(extensions = [], suffix)
      extensions.map { |e| "#{e}.#{suffix}" }
    end
  end
end
