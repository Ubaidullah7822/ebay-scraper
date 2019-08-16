# initialize nokogiri
nokogiri = Nokogiri.HTML(content)

books = result.xpath("//div[@class='item-info']")

books.each do |book|
    product = {}

    product['title'] = book.xpath("//div//h2//a[@class='action-link']").first.text
    detail_page = book.xpath("//div//h2//a[@class='action-link']").first
    product['url'] = detail_page['href'] unless detail_page.nil?

    product['_collection'] = "book_listings"

    outputs << product

    pages << {
        url: product['url'],
        page_type: 'book_detail',
        vars: {
          title: product['title']
        }
      }
end
