ActiveAdmin.register_page "download" do
  menu priority: 2, label: proc { I18n.t("active_admin.download") }

  content title: proc { I18n.t("active_admin.download") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
  end
  content do
    buebug
    render partial: 'download'
    require 'nokogiri' # gem install nokogiri
    require 'open-uri' # already part of your ruby install
    qwe = Nokogiri::HTML(open(URL)).css('img/@src')
    qwe.each do |src|
      uri = URI.join( URL, src ).to_s # make absolute uri
      File.open(File.join('images', File.basename(uri)),'wb'){ |f|
        f.write( open(uri).read )
      }
    end
  end

  # create do
  #
  # end

end
