module ApplicationHelper
  
  def build_navs
    nav_elems = ''
    navs = ['Home', 'Invoices', 'Clients']
    navs.each do |nav|
      case nav
      when 'Home'
        nav_path = root_path
      when 'Invoices'
        nav_path = invoices_path
      when 'Clients'
        nav_path = clients_path
      end
        
      nav_elems += '<li class="' + (controller_path.capitalize == nav || (nav == 'Home' && controller_path == "main" )  ? "active" : "") + '"><a href='"#{nav_path}"'>' + nav + '</a></li>'
    end
    return nav_elems
  end
end
