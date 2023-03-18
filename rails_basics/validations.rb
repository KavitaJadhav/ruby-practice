class User
end

validates_absence_of :name
validates :name, presence: true
validates_associated
validates :email, confirmation: true
validates :subdomain, exclusion: {in: %w(www us ca jp),
                                  message: "%{value} is reserved."}
validates :legacy_code, format: {with: /\A[a-zA-Z]+\z/,
                                 message: "only allows letters"}
validates :size, inclusion: {in: %w(small medium large),
                             message: "%{value} is not a valid size"}
validates :name, length: {minimum: 2}
validates :bio, length: {maximum: 500}
validates :password, length: {in: 6..20}
validates :registration_number, length: {is: 6}
validates :points, numericality: true
validates :name, uniqueness: {case_sensitive: false}


create
create!
save
save!
update
update!
update_attributes


# invoking methods
Create
create!
save
save!
update
update!


# skip validations
update_column
update_columns
update_counters
increment!
increment_counter!
decrement!
decrement_counter!
touch
touch_all
insert
insert!
insert_all
insert_all!
toggle!
upsert!
upsert_all!
update_all
save(validate: false)


class TestValidator < ActiveModel::Validator
  def validate(record)
    if record.name != 'foo'
      record.errors.add :base, ('is not foo')
    end
  end
end

class Test1
  validates_with TestValidator
end

class Test2
  validate do
    TestValidator.new(self).validate
  end
end

