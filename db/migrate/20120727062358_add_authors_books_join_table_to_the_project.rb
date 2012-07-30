class AddAuthorsBooksJoinTableToTheProject < ActiveRecord::Migration
  def up
  	create_table :authors_books, :id => false do |t|
  		t.integer :author_id, :null => false
  		t.integer :book_id, :null => false
  	end
  	say_with_time 'Adding foreign keys' do
  		# add foreign key references to authors_books table
  		execute 'alter table authors_books add constraint fk_bk_authors foreign key(author_id) references authors(id) on delete cascade'
  		execute 'alter table authors_books add constraint fk_bk_books foreign key(book_id) references books(id) on delete cascade'
  		# add foreign key references to publishers table
  		execute 'alter table books add constraint fk_books_publishers foreign key(publisher_id) references publishers(id) on delete cascade'
  	end
  end
  def down
    execute 'alter table books drop foreign key fk_books_publishers'
    execute 'alter table authors_books drop foreign key fk_bk_books'
    execute 'alter table authors_books drop foreign key fk_bk_authors'
    drop_table :authors_books
  end
end
