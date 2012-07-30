atom_feed language: 'en-US' do |feed|
	feed.updated @updated
	@books.each do |book|
		next if book.updated_at.blank?
		feed.entry(book) do |entry|
			entry.title(book.title)
			entry.url book_url(book)
			entry.blurb book.blurb, type: 'html'
			entry.updated(book.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
		end
	end
end