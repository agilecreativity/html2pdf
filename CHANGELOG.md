### Changelogs for html2pdf

#### 0.2.2

- Support ruby 1.9.3+
- Misc code cleanup

#### 0.2.1

- Make ruby 2.1.0+ a mandatory

#### 0.2.0

- Make use of refinement instead of monkeypatching gem
- Only support for 2.1.x+
- Misc cleanup

#### 0.1.7

- Add `--disable-smart-shrinking` option in wkhtmltopdf
- Update `rubocop` to 0.23.x version
- Allow the customization through configuration

#### 0.1.6

- Make use of the starting directory in the output filename

#### 0.1.5

- Minor code cleanup

#### 0.1.4

- Make the `--base-dir` works properly with the relative directory that is not '.'

#### 0.1.3

- Respect the `--recursive` options
- Add the missing require `minitest` in test_helper.rb

#### 0.1.2

- Simplify the CLI
- Style cleanup with rubocop

#### 0.1.1

- Remove 'ghostscript' from the required software in error message

#### 0.1.0

- Use the [Semantic Versioning][] release scheme
- Update the gemspec and README.md file
- Fix styles with rubocop

#### 0.0.1 - 0.0.7

- Old releases that does not follow [Semantic Versioning][]
- Implement features and fix a few bugs along the way.

[agile_utils]: https://github.com/agilecreativity/agile_utils
[code_lister]: https://github.com/agilecreativity/code_lister
[gemnasium]: https://gemnasium.com/agilecreativity/html2pdf
[codeclimate]: https://codeclimate.com/github/agilecreativity/html2pdf
[minitest]: https://github.com/seattlerb/minitest
[Semantic Versioning]: http://semver.org/
