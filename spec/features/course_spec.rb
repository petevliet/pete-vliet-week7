require 'rails_helper'

describe 'user can CRUD courses' do

  before :each do
    User.create(user_name: 'test_user', password: 'password')
    visit '/login'
      fill_in 'user_name', with: 'test_user'
      fill_in 'password', with: 'password'
      click_on 'Sign In'

    click_on 'Courses'

    click_on 'New Course'
      fill_in 'course[title]', with: 'lunch'
      click_on 'Create Course'

      visit '/courses'
  end

  scenario 'user can create a course' do

    click_on 'New Course'
      fill_in 'course[title]', with: 'Geography'
      click_on 'Create Course'

    expect(page).to have_content('New course added')
  end

  scenario 'user can view course show page' do

    click_on 'lunch'

    expect(page).to have_content('lunch')

  end

  scenario 'user can edit course' do

    click_on 'Edit'
    check 'course[day_night]'
    click_on 'Update Course'

    expect(page).to have_content 'Course updated'
  end

  scenario 'user can delete course' do

    click_on 'Delete'
    expect(page).to have_content 'Course deleted'

  end
end
