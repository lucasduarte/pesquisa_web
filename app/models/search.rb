class Search < ActiveRecord::Base
  require 'rubygems'
  require 'mechanize'

  @search_word
  @found_products

  def Search.load_products_links link, product_link_tag
    agent = Mechanize.new
    page = agent.get(link)

    agent.shutdown()

    page.search(product_link_tag)
  end

  def Search.load_product_page_html link
    agent = Mechanize.new
    page = agent.get(link)

    agent.shutdown()

    page
  end

  def Search.parse_product_html page, site, product_link
    product = Product.new

    product.status = true
    product.search_word = @search_word

    product.price = page.search(site.price_tag).to_s
                                               .delete("^0-9,")
                                               .gsub(',','.')
                                               .to_d
    product.link = product_link
    product.image_link = page.search(site.image_tag).to_s
    product.site_id = site.id
    product.description = page.search(site.description_tag).to_s
    product.category = page.search(site.category_tag).to_s
                                                     .strip
                                                     .split.map(&:capitalize).join(' ')
    if product.category == ""
      product.category = "N/A"
    end
    product
  end

  def Search.search_products search_word
    @search_word = search_word
    sites = Site.where(:status => true)
    threads = Array.new
    product_threads = Array.new
    @found_products = Array.new

    sites.each do |s|
      threads << Thread.new {

        #Load link for each product
        links = Array.new
        links = load_products_links(s.link + @search_word, s.product_link_tag)

        pages = Array.new
        links.each { |l|

          product_threads << Thread.new {
            page = load_product_page_html(l.to_s)

            @found_products << parse_product_html(page, s, l.to_s)
          }
        }

        product_threads.each {|x| x.join}

      }
    end

    threads.each {|x| x.join}

    #Remove products with price less than or equals zero
    @found_products.reject! { |x| x.price <= 0.0 }

    Thread.new { save_data }

    @found_products.sort_by{|e| e[:price]}

  end

  def Search.save_data
    Thread.new{

      Search.where(search_word: @search_word).first_or_create

      Product.transaction do
      Product.where("search_word = ?", @search_word)
             .update_all(:status => false)
      @found_products.each(&:save)

      end
    }
  end

  def Search.update_prices
    searches = Search.all

    searches.each do |s|
      Thread.new { search_products s.search_word }
      #debugger
      sleep 15
    end

  end
end
