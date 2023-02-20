require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:first) # Reference to the first fixture post
  end
  
  test "Visit index" do
    # sign_in users(:regular
    visit posts_url
    assert_selector "h1", text: "posts"
  end
  
  test "Creating a new post" do
    # When we visit the posts#index page
    # we expect to see a title with the text "posts"
    # sign_in users(:regular)
    visit posts_url
    assert_selector "h1", text: "posts"

    # When we click on the link with the text "New post"
    # we expect to land on a page with the title "New post"
    click_on "New post"
    assert_selector "h1", text: "New post"

    # When we fill in the name input with "Capybara post"
    # and we click on "Create post"
    fill_in "Title", with: "Title test"
    click_on "Create post"

    # We expect to be back on the page with the title "posts"
    # and to see our "Capybara post" added to the list
    assert_selector "h1", text: "Posts"
    assert_text "Capybara post"
  end

 test "Showing a post" do
    visit posts_path
    click_link @post.title

    assert_selector "h1", text: @post.title
  end

  test "Updating a post" do
    visit posts_path
    assert_selector "h1", text: "posts"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit post"

    fill_in "Title", with: "Updated post"
    click_on "Update post"

    assert_selector "h1", text: "posts"
    assert_text "Updated post"
  end

  test "Destroying a post" do
    visit posts_path
    assert_text @post.title

    click_on "Delete", match: :first
    assert_no_text @post.title
  end
end