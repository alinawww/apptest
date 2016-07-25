class AddAttachmentAvatarToSpeakers < ActiveRecord::Migration
  def self.up
    change_table :speakers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :speakers, :avatar
  end
end
