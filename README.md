## CodeExporter

Export source code for any type of programming language to pdf.
Inspired by the [code_rippa][] gem.

The gem rely on the power of multiple opensource tools

- [Vim][] - for printing the code using the `:TOhtml` to print file
  to html format
- [Ghostscript][] - for combining multiple pdf files
- [Pdfinfo][] - for extracting useful meta-data from the pdf for use in the header/footer
- [Wkhtmltopdf][] - for converting file to PDF
- [mdls][] - for extracting meta-data if the platform is OSX

### Installation

#### Mandatory Requirement

- [Vim][] any recent version of Vim
- [Ghostscript][]
- [Pdfinfo][]
- [Wkhtmltopdf][]
- [mdls][] on OSX

#### Other Gems

This gem rely on some of the functionality that I built earlier.
The list of gems that this gem is depend on are

- [vim_printer][] gem
- [agile_utils][] gem
- [code_lister][] gem

### Dependencies

- wkhtmltopdf (Linux/OSX)
- pdfinfo (Linux/OSX)
- mdls (OSX) for listing of meta-data information
- Ghostscript (Linux/OSX)
- OSX or Linux (no Windows sorry)

## Usage

```sh
gem install code_exporter
```
For list of usage type

```sh
code_exporter
```
Which should give the following options

```
TODO: add sample output from `usage` here!
```
### Good snippets

```ruby
# check for installation of wkhtmltopdf on Linux/OSX
if RUBY_PLATFORM =~ /linux/
  executable = 'wkhtmltopdf_linux_386'
elsif RUBY_PLATFORM =~ /darwin/
  executable = 'wkhtmltopdf_darwin_386'
else
  raise "Invalid platform. Must be running linux or intel-based Mac OS."
end

executable = File.join(File.dirname(__FILE__), executable)

system(executable + " " + $*.join(" "))

```
### Changelogs

#### 0.0.1

- Initial release

### Contributing

1. Fork it ( http://github.com/<my-github-username>/code_exporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Resources
[Vim]: http://www.vim.org/
[Ghostscript]: http://www.ghostscript.com/
[Pdfinfo]: http://linux.about.com/library/cmd/blcmdl1_pdfinfo.htm
[Wkhtmltopdf]: http://wkhtmltopdf.org/
[mdls]: https://developer.apple.com/library/Mac/documentation/Darwin/Reference/ManPages/man1/mdls.1.html
[code_rippa]: https://github.com/benjamintanweihao/code_rippa
[code_rippa - slideshare]: http://www.slideshare.net/benjamintanweihao/code-rippa
[vim_printer]: https://github.com/agilecreativity/vim_printer
[agile_utils]: https://github.com/agilecreativity/agile_utils
[code_lister]: https://github.com/agilecreativity/code_lister
