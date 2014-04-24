require_relative '../../test_helper'
describe Html2Pdf do
  context '#page_count' do
    # it 'returns result for valid command' do
    #   input_file = 'test/fixtures/samples/demo1_xxx.rb.xhtml.pdf'
    #   result = Html2Pdf::PdfUtils.page_count(input_file)
    #   result.must_equal 1
    # end
    it 'raises error on invalid command' do
      skip 'TODO: please revisit this test'
      # Html2Pdf::PdfUtils.page_count('bad-file.pdf')
    end
  end
end
