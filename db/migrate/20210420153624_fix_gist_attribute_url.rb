class FixGistAttributeUrl < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :gists, :url, :hash_id
  end

  def self.down
    rename_column :gists, :hash_id, :url
  end
end
