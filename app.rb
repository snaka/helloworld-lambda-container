require 'base64'
require 'json'
require 'prawn'

def handler(event:, context:)
  pdf = Prawn::Document.new
  pdf.text "Hello World!"
  pdf_base64_encoded = Base64.encode64(pdf.render)

  {
    statusCode: 200,
    headers: {
      'Content-Length': pdf_base64_encoded.length,
      'Content-Type': 'application/pdf',
      'Content-disposition': 'attachment;filename=hello.pdf'
    },
    isBase64Encoded: true,
    body: pdf_base64_encoded
  }
end
