module Html2Pdf
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
      wkhtmltopdf   = Html2Pdf.configuration.options[:wkhtmltopdf]
      page_settings = Html2Pdf.configuration.options[:page_settings]
      command = [
        wkhtmltopdf,
        *page_settings,
        filename,
        "#{filename}.pdf",
        "> /dev/null"
      ]
      _stdin, _stderr, status = Open3.capture3(command.join(" "))
      fail "Problem processing #{filename}" unless status.success?
    end

    # Check and return if the 'wkhtmltopdf' is available
    def softwares_installed?
      AgileUtils::Helper.which("wkhtmltopdf")
    end
  end
end
