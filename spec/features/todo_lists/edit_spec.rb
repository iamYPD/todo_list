require 'spec_helper'

describe "Editing todo lists" do 
	let!(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery list.") }

	def update_todo_list(options={})
		options[:title] ||= "New title"
		options[:description] ||= "New description"

		todo_list = options[:todo_list]

		visit "/todo_lists"
		within "#todo_list_#{todo_list.id}" do
			click_link "Edit"
		end

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Update Todo list"
	end

	it "updates a todo list successfully with correct information" do

		update_todo_list todo_list: todo_list
		todo_list.reload
		expect(page).to have_content("Todo list was successfully updated")
		expect(todo_list.title).to eq("New title")
		expect(todo_list.description).to eq("New description")
	end

	it "displays an error when a todo list is updated without a Title" do

		update_todo_list todo_list: todo_list, 
						 title: ""
		todo_list.reload
		expect(page).to have_content("error")
	end

	it "displays an error when a todo list is updated without a Description" do

		update_todo_list todo_list: todo_list, 
						 description: ""
		todo_list.reload
		expect(page).to have_content("error")
	end

	it "displays an error when a todo list is updated with a Title less than 3 characters" do

		update_todo_list todo_list: todo_list, 
						 title: "Ne"
		todo_list.reload
		expect(page).to have_content("Title is too short (minimum is 3 characters)")
	end

	it "displays an error when a todo list is updated with a Description less than 1- characters" do

		update_todo_list todo_list: todo_list, 
						 description: "New Descr"
		todo_list.reload
		expect(page).to have_content("Description is too short (minimum is 10 characters)")
	end

end



# 1. Update task check - TICK 
# 2. No title check - TICK
# 3. No description check - TICK
# 4. Title < 3 characters error check
# 5. Description < 10 characters check

