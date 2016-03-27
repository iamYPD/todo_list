require 'spec_helper'

describe "Editing todo lists" do 
	let!(:todo_list) { TodoList.create(title: "Groceries", descriptioin: "Grocery list.") }

	def update_todo_list(options={})
		options[:title] ||= "My todo list"
		options[:descriptioin] ||= "This is my todo list"

		todo_list = options[:todo_list]

		visit "/todo_lists"
		within "#todo_list_#{todo_list.id}" do
			click_link "Edit"
		end

		fill_in "Title", with: options[:title]
		fill_in "Descriptioin", with: options[:descriptioin]
		click_button "Update Todo list"
	end

	it "updates a todo list successfully with correct information" do

		update_todo_list todo_list: todo_list, 
						 title: "New title", 
						 descriptioin: "New description"

		todo_list.reload

		expect(page).to have_content("Todo list was successfully updated")
		expect(todo_list.title).to eq("New title")
		expect(todo_list.descriptioin).to eq("New description")
	end
end

