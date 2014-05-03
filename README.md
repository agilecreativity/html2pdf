## Html2Pdf

[![Gem Version](https://badge.fury.io/rb/html2pdf.svg)](http://badge.fury.io/rb/html2pdf)
[![Dependency Status](https://gemnasium.com/agilecreativity/html2pdf.png)](https://gemnasium.com/agilecreativity/html2pdf)
[![Code Climate](https://codeclimate.com/github/agilecreativity/html2pdf.png)](https://codeclimate.com/github/agilecreativity/html2pdf)

Convert multiple html or xhtml files to pdfs using the power of
[Ghostscript][] and [Wkhtmltopdf][].

### Installation

#### Mandatory Requirement

- [Ghostscript][]
- [Wkhtmltopdf][]

This gem is built on top of my other gems

- [agile_utils][] gem
- [code_lister][] gem

### Dependencies

- wkhtmltopdf (Linux/OSX)
- Ghostscript (Linux/OSX)
- OSX or Linux (no Windows sorry)

## Usage
```sh
gem install html2pdf
```
For list of usage type

```sh
html2pdf
```

Which should give the following options

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

1. Fork it ( http://github.com/<my-github-username>/code_exporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[Ghostscript]: http://www.ghostscript.com/
[Wkhtmltopdf]: http://wkhtmltopdf.org/
[agile_utils]: https://github.com/agilecreativity/agile_utils
[code_lister]: https://github.com/agilecreativity/code_lister
[vim_printer]: https://github.com/agilecreativity/vim_printer
[pdfs2pdf]: https://github.com/agilecreativity/pdfs2pdf
[gemnasium]: https://gemnasium.com/agilecreativity/html2pdf
[codeclimate]: https://codeclimate.com/github/agilecreativity/html2pdf
