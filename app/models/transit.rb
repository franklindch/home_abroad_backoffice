class Transit < ApplicationRecord
	has_and_belongs_to_many :travels, class_name: 'Travel'
	enum nature: { 
	  Pré_acheminement: 0, Post_acheminement: 1 
	}
	enum mode: { 
		Avion: 0, Train: 1
	}
end
