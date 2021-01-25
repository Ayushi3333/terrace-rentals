class InvoicesController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "terrace_rentals_invoice.pdf",
        template: 'layouts/pdf.html.erb',
        orientation: 'Portrait',
        stream: false,
        layout: 'layouts/pdf.html.erb'
      end
    end
  end
end
