require_relative "../../test_helper"
describe Html2Pdf do
  context "#to_pdf" do
    it "raises error on invalid input file" do
      assert_raises(RuntimeError) { Html2Pdf.to_pdf("bad-file-name") }
    end
  end
  context "#softwares_installed?" do
    it "raises error if the requirements are not met" do
      assert(Html2Pdf.softwares_installed?,
             "Must have valid installation of `wkhtmltopdf`")
    end
  end
end
