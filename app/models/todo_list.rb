class TodoList < ActiveRecord::Base

	validates :title, presence: true
	validates :descriptioin, presence: true
	validates :title, length: { minimum:3 }
	validates :descriptioin, length: { minimum:10 }

end

