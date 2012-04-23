xml.instruct!

xml.urlset "xmlns" => "http://www.google.com/schemas/sitemap/0.84" do

	xml.url do
		xml.loc         url_for(:only_path => false, :controller => 'home')
		xml.lastmod     w3c_date(Time.now)
		xml.changefreq  "always"
		xml.priority    1
	end

	@categories.each do |cat|
		unless cat.items.blank? or cat.slug == 'catering'
			xml.url do
				if cat.parent.blank?
					xml.loc         url_for(:only_path => false, :controller => 'menu', :action => cat.slug)
				else
					xml.loc         url_for(:only_path => false, :controller => 'menu', :action => cat.parent.slug, :id => cat.slug)
				end
				unless cat.items.last.updated_at.blank?
					xml.lastmod     w3c_date(cat.items.last.updated_at)
				end
				xml.changefreq  "weekly"
				xml.priority    0.6
			end
		end
	end

	xml.url do
		xml.loc         url_for(:only_path => false, :controller => 'locations')
		xml.lastmod     w3c_date(Time.now)
		xml.changefreq  "monthly"
		xml.priority    0.6
	end

	xml.url do
		xml.loc         url_for(:only_path => false, :controller => 'offers')
		xml.lastmod     w3c_date(Time.now)
		xml.changefreq  "monthly"
		xml.priority    0.6
	end

	xml.url do
		xml.loc         url_for(:only_path => false, :controller => 'catering')
		xml.lastmod     w3c_date(Time.now)
		xml.changefreq  "monthly"
		xml.priority    0.2
	end

	xml.url do
		xml.loc         url_for(:only_path => false, :controller => 'about', :action => 'history')
		xml.lastmod     w3c_date(Time.now)
		xml.changefreq  "monthly"
		xml.priority    0.2
	end

	xml.url do
		xml.loc         url_for(:only_path => false, :controller => 'about', :action => 'news')
		xml.lastmod     w3c_date(Time.now)
		xml.changefreq  "monthly"
		xml.priority    0.2
	end

	@posts.each do |post|
		xml.url do
			xml.loc         url_for(:only_path => false, :controller => 'about', :action => 'news_view', :id => post)
			xml.lastmod     w3c_date(post.created_at)
			xml.changefreq  "weekly"
			xml.priority    0.2
		end
	end

	xml.url do
		xml.loc         url_for(:only_path => false, :controller => 'about', :action => 'community')
		xml.lastmod     w3c_date(Time.now)
		xml.changefreq  "monthly"
		xml.priority    0.2
	end

	xml.url do
		xml.loc         url_for(:only_path => false, :controller => 'about', :action => 'gift_cards')
		xml.lastmod     w3c_date(Time.now)
		xml.changefreq  "monthly"
		xml.priority    0.2
	end

	xml.url do
		xml.loc         url_for(:only_path => false, :controller => 'about', :action => 'franchising')
		xml.lastmod     w3c_date(Time.now)
		xml.changefreq  "monthly"
		xml.priority    0.2
	end

	xml.url do
		xml.loc         url_for(:only_path => false, :controller => 'about', :action => 'careers')
		xml.lastmod     w3c_date(Time.now)
		xml.changefreq  "monthly"
		xml.priority    0.2
	end

	xml.url do
		xml.loc         url_for(:only_path => false, :controller => 'about', :action => 'contact')
		xml.lastmod     w3c_date(Time.now)
		xml.changefreq  "monthly"
		xml.priority    0.2
	end

end