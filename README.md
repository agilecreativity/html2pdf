## Html2Pdf

[![Gem Version](https://badge.fury.io/rb/html2pdf.svg)][gem]
[![Dependency Status](https://gemnasium.com/agilecreativity/html2pdf.png)][gemnasium]
[![Code Climate](https://codeclimate.com/github/agilecreativity/html2pdf.png)][codeclimate]

[gemnasium]: https://gemnasium.com/agilecreativity/html2pdf
[codeclimate]: https://codeclimate.com/github/agilecreativity/html2pdf
[gem]: http://badge.fury.io/rb/html2pdf

Convert multiple html or xhtml files to pdfs using the power of [wkhtmltopdf][].

### Installation

### Mandatory Requirement

- [wkhtmltopdf][] - please see [wkhtmltopdf installation][] for detail

### Dependencies

- wkhtmltopdf (Linux/OSX)
- OSX or Linux

## Usage

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
html2pdf export [OPTIONS]

Options:
  -b, [--base-dir=BASE_DIR]                # Base directory
                                           # Default: . (current directory)
  -n, [--inc-words=one two three]          # List of words to be included in the result
  -x, [--exc-words=one two three]          # List of words to be excluded from the result
  -i, [--ignore-case], [--no-ignore-case]  # Match case insensitively
                                           # Default: true
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

You should get the output `html2pdf-output.tar.gz`
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

