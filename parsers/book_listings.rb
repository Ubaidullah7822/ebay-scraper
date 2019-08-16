# initialize nokogiri
result = Nokogiri.HTML(content)

books = result.xpath("//div[@class='item-info']")

books.each do |book|
    product = {}

    item = book.at_css('div.text-detail a')
    product['title'] = item.text
    product['url'] = "https://www.bookstore.ca#{item['href']}" unless item.nil?

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
