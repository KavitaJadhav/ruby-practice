
validate_presense_of :name
validate name, presence: true
validate_uniqness_of :name
validate_uniqness_of :name, scope :id
validate_inclusion_of name, [kavita, jyoti]


has_one - address
belongs_to: company



name,  uniqness:true