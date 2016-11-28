class Todo < ActiveRecord::Base
  attr_accessible :deadline, :desc, :notified, :notify, :priority, :reminder, :status
  belongs_to :user
  validates :user_id, presence: true

    def self.to_csv
        desired_columns = ["desc", "priority", "deadline", "status"]
        CSV.generate do |csv|
                csv << desired_columns
                all.each do |todo|
                        csv << todo.attributes.values_at(*desired_columns)
                end
     end
  end
end
