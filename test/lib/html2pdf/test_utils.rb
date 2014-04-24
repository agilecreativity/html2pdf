require_relative '../../test_helper'
describe Html2Pdf::Utils do
  context '#to_pdf' do
    it 'raises error on invalid input file' do
      assert_raises(RuntimeError) { Html2Pdf::Utils.to_pdf('bad-file-name') }
    end
  end
  context '#have_required_softwares' do
    it 'raises error if the requirements are not met' do
      assert(Html2Pdf::Utils.required_softwares?,
            'Must have valid installation of `wkhtmltopdf` and `ghostscript`')
    end
  end
end
