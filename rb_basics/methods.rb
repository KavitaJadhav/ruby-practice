
nil.nil?
''.nil?
nil.blank?
false.blank?
"".empty?
" ".empty?
{}.empty?
nil.empty?
"".present?
" ".present?
0.present?
"\t\n".empty?
"\t\n".present?


# ------------------------------------------------------------------------------------------------------------------
# Ruby

nil.nil? = true
''.nil? - false
nil.blank? - #undefined method `blank?' for nil:NilClass
false.blank? - #undefined method `blank?' for false:FalseClass
"".empty? - true
" ".empty? - false
{}.empty? - true
nil.empty? - #undefined method `empty?' for nil:NilClass
"".present? - #undefined method `present?' for "":String
" ".present? - # undefined method `present?' for " ":String
0.present? - #undefined method `present?' for 0:Integer
"\t\n".empty? - false
"\t\n".present? - # undefined method `present?' for "\t\n":String


# ------------------------------------------------------------------------------------------------------------------
# Rails

nil.nil?
''.nil?
nil.blank?
false.blank?
"".empty?
" ".empty?
{}.empty?
nil.empty?
"".present?
" ".present?
0.present?
"\t\n".empty?
"\t\n".present?

# ------------------------------------------------------------------------------------------------------------------


['a100', '100', 'a129', 'a200', 'a130', 'a120', 'aaaa', '0000', '000'].sort
# ["000", "0000", "100", "a100", "a120", "a129", "a130", "a200", "aaaa"]
#