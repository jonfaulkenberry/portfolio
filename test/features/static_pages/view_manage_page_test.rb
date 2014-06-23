feature "Manage page" do
  scenario "allows owners access" do
    sign_in_as_owner
    visit manage_path   
    page.text.must_include "New post"
    page.text.must_include "New project"             
  end 
  scenario "does not allow visitors access" do
    visit manage_path
    page.has_content? "You are not authorized to perform this action"
  end
end