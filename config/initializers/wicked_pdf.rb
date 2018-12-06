# WickedPDF Global Configuration
#
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md

if Rails.env.staging? || Rails.env.production?
    exe_path = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
elsif(Rails.env.development?)
    WickedPdf.config = {
        exe_path:  'C:\wkhtmltopdf\bin\wkhtmltopdf.exe'
    }
end
