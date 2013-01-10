class AddVotesnumberColumnToNames < ActiveRecord::Migration
  def change
    add_column :names, :votesnumber, :integer
  end
end
