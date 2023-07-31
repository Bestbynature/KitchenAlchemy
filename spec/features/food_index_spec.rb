require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  scenario 'User can view a list of foods' do
    # Create some sample foods in the database
    food1 = Food.create(name: 'Food 1', measurement_unit: 'Unit', price: 10.99)
    food2 = Food.create(name: 'Food 2', measurement_unit: 'Grams', price: 5.99)

    # Visit the foods index page
    visit foods_path

    # Expect to see the names of the foods in the page
    expect(page).to have_content(food1.name)
    expect(page).to have_content(food2.name)
  end

  scenario 'User can create a new food' do
    # Visit the new food page
    visit new_food_path

    # Fill in the form fields
    fill_in 'Name', with: 'New Food'
    fill_in 'Measurement unit', with: 'Piece'
    fill_in 'Price', with: 15.99

    # Submit the form
    click_button 'Create Food'

    # Expect to see the success message
    expect(page).to have_content('Food was successfully created.')

    # Expect to be redirected to the foods index page
    expect(page).to have_current_path(foods_path)

    # Expect to see the new food in the list
    expect(page).to have_content('New Food')
  end

  scenario 'User can update an existing food' do
    # Create a sample food in the database
    food = Food.create(name: 'Old Food', measurement_unit: 'Kilograms', price: 20.99)

    # Visit the edit food page
    visit edit_food_path(food)

    # Fill in the form fields with updated values
    fill_in 'Name', with: 'Updated Food'
    fill_in 'Measurement unit', with: 'Grams'
    fill_in 'Price', with: 25.99

    # Submit the form
    click_button 'Update Food'

    # Expect to see the success message
    expect(page).to have_content('Food was successfully updated.')

    # Expect to be redirected to the food show page
    expect(page).to have_current_path(food_path(food))

    # Expect to see the updated food details
    expect(page).to have_content('Updated Food')
    expect(page).to have_content('Grams')
    expect(page).to have_content('25.99')
  end

  scenario 'User can delete a food' do
    # Create a sample food in the database
    food = Food.create(name: 'Food to be deleted', measurement_unit: 'Piece', price: 8.99)

    # Visit the foods index page
    visit foods_path

    # Expect to see the name of the food in the page
    expect(page).to have_content(food.name)

    # Click the delete link
    click_link 'Delete', href: food_path(food)

    # Expect to see the confirmation dialog
    expect(page.driver.browser.switch_to.alert.text).to eq('Are you sure you want to delete this food?')

    # Confirm the deletion
    page.driver.browser.switch_to.alert.accept

    # Expect to see the success message
    expect(page).to have_content('Food was successfully destroyed.')

    # Expect the food to be removed from the list
    expect(page).not_to have_content(food.name)
  end
end
