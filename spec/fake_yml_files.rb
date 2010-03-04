TEST_YML = <<-END_SETTINGS
file: test.yml

some_variable: some value

my_string: string

my_integer: 1

my_array:
  - 1
  - 2
  - 3
  - 4

my_hash:
  one: 1
  two: 2

two:
  three: 3

four:
  five:
    six: 6
    
my_erb_variable: <%= 1 + 2 %>
END_SETTINGS

SETTINGS_YML = <<-END_SETTINGS
test:
  file: settings.yml
END_SETTINGS