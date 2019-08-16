# initialize nokogiri
result = Nokogiri.HTML(content)

price = result.xpath("//h2//span[@class='item-total ']").first&.text

author = result.xpath("//div[@class='heading-text']/p")&.text

# save it into outputs
outputs << {
    _collection: 'books',
    title: page['vars']['title'],
    price: price,
    author: author
}
