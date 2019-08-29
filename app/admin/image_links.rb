ActiveAdmin.register ImageLink do
  config.filters = false
  permit_params do
    permitted = %i[url]
    permitted
  end

  controller do
    def create
      ImageLink.create(url: params['image_link']['url'])
      redirect_to admin_image_links_path
    end

    def show
      @url = ImageLink.find(params[:id]).url
    end
  end

  show do
    attributes_table do
      asd = Nokogiri::HTML(open(url))
      qwe = asd.css('img/@src')
      qwe.each do |src|
        if src.value[/.+(jpg|jpeg)$/].present?
          uri = URI.join( url, src ).to_s # make absolute uri
          div link_to image_tag(uri), new_admin_image_path(:remote_path_url => "#{uri}")
        end
      end
    end
  end
end
