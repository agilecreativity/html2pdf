require "open3"
require "thor"
require "tmpdir"
require "fileutils"
require "agile_utils"
require "code_lister"
require "html2pdf/version"
require "html2pdf/configuration"
require "html2pdf/config/html2pdf"
require "html2pdf/html2pdf"
require "html2pdf/cli"
include AgileUtils::Options
include CodeLister
include Html2Pdf
Html2Pdf.update_config
