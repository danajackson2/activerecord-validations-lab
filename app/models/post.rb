class Post < ActiveRecord::Base
    validates_presence_of :title
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum:250}
    validates :category, inclusion: {in:["Fiction", "Non-Fiction"]}
    validate :clickbait

    def clickbait
        if self.title == nil || self.title[/Won't Believe|Secret|Top|Guess/] == nil
            errors.add(:clickbait, "Not clickbaity enough")
        end
    end

end
