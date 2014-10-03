## html2pdf

[![Gem Version](https://badge.fury.io/rb/html2pdf.svg)][gem]
[![Dependency Status](https://gemnasium.com/agilecreativity/html2pdf.png)][gemnasium]
[![Code Climate](https://codeclimate.com/github/agilecreativity/html2pdf.png)][codeclimate]

[gemnasium]: https://gemnasium.com/agilecreativity/html2pdf
[codeclimate]: https://codeclimate.com/github/agilecreativity/html2pdf
[gem]: http://badge.fury.io/rb/html2pdf

Convert multiple html or xhtml files to pdfs using the power of [wkhtmltopdf][].

Note: starting from version `0.1.0` this gem will be release based on [Semantic Versioning][] convention.

### Installation

### Mandatory Requirement

- [wkhtmltopdf][] - please see [wkhtmltopdf installation][] for detail

### Usage

```sh
gem install html2pdf
```

For list of usage type

```sh
html2pdf
```

Which should give the following output

```
Usage:
html2pdf

Options:
  -b, [--base-dir=BASE_DIR]                # Base directory
                                           # Default: . (current directory)
  -r, [--recursive], [--no-recursive]      # Search for files recursively
                                           # Default: true
  -v, [--version], [--no-version]          # Display version information
```

### Example Usage

- Convert all `xhtml` and `html` from `test/fixtures/samples` directory
  recursively
```
html2pdf -b test/fixtures/samples -r
```
Before the run
```
test/fixtures/samples/
├── demo1_xxx.rb.xhtml
├── demo2_xxx.rb.xhtml
└── sub_dir
    ├── demo3_xxx.rb.xhtml
    └── demo4_xxx.rb.xhtml
```
After the above command is executed:

You should get the output `html2pdf_samples.tar.gz`
which contain the pdf version of the input files above.
e.g.

```
├── demo1_xxx.rb.xhtml.pdf
├── demo2_xxx.rb.xhtml.pdf
└── sub_dir
    ├── demo3_xxx.rb.xhtml.pdf
    └── demo4_xxx.rb.xhtml.pdf
```

### Usage Tips

This is my personal use case

- Use [vim_printer][] which export any source code to list of (x)html files in
a single tar.gzipped file.

- Use the output from [vim_printer][] as input to this program so that you get
the pdf version of it.

- Then combine the generated pdf files using [pdfs2pdf][] gem to produce one pdf file

### Customization

If you like to adjust the output for pdf you can override the default settings by
set your own configuration in the file `lib/html2pdf/config/html2pdf.rb`

For more customization please see the [wkhtmltopdf manual][] page for detail.

```ruby
module Html2Pdf
  class << self
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
```

### Contributing

1. Fork it ( http://github.com/agilecreativity/html2pdf/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[vim_printer]: https://github.com/agilecreativity/vim_printer
[pdfs2pdf]: https://github.com/agilecreativity/pdfs2pdf
[wkhtmltopdf]: http://wkhtmltopdf.org/
[wkhtmltopdf installation]: https://github.com/pdfkit/pdfkit/wiki/Installing-WKHTMLTOPDF
[wkhtmltopdf manual]: http://wkhtmltopdf.org/usage/wkhtmltopdf.txt
[Semantic Versioning]: http://semver.org
