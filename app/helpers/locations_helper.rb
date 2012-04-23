module LocationsHelper
  
  def google_maps_lookup(loc)
    lookup = "http://maps.google.com/maps?q="
    lookup += CGI.escape([loc.street, loc.city, loc.province.abbreviation].join(" "))
    lookup
  end
  
end
