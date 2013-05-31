require_relative '../config'

class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :name_suffix
      t.string :gender
      t.date   :birthday
      t.string :email
      t.string :phone
      t.string :party
      t.string :state
      t.string :in_office
      t.string :fax
      t.string :website
      t.string :twitter_id
    end

  end
end

