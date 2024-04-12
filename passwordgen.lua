-- Function to generate a random character from a character set
function random_char(char_set)
  local start, stop = string.find(char_set, "%d+")
  local range = stop - start + 1
  local random_index = math.random(range)
  return string.sub(char_set, start + random_index - 1, start + random_index - 1)
end

-- Function to generate a random password
function generate_password(length, lowercase, uppercase, numbers, symbols)
  local char_sets = {}
  if lowercase then
    table.insert(char_sets, string.charrange(97, 122)) -- lowercase letters
  end
  if uppercase then
    table.insert(char_sets, string.charrange(65, 90)) -- uppercase letters
  end
  if numbers then
    table.insert(char_sets, string.charrange(48, 57)) -- numbers
  end
  if symbols then
    table.insert(char_sets, "!@#$%^&*()_+-=[]{}|;':\",./<>?~") -- symbols
  end

  local password = ""
  for i = 1, length do
    local random_char_set = table.random(char_sets)  -- Choose random character set
    password = password .. random_char(random_char_set) -- Get random char from chosen set
  end
  return password
end

-- Get user input for password length
local desired_length = io.read("Enter desired password length: ")

-- Check if input is a valid number
if not tonumber(desired_length) then
  print("Invalid input! Please enter a number for password length.")
else
  -- Convert string to number
  desired_length = tonumber(desired_length)

  -- Prompt for character set options
  local include_lowercase = io.read("Include lowercase letters (y/n)? ") == "y"
  local include_uppercase = io.read("Include uppercase letters (y/n)? ") == "y"
  local include_numbers = io.read("Include numbers (y/n)? ") == "y"
  local include_symbols = io.read("Include symbols (y/n)? ") == "y"

  -- Generate and display password
  local password = generate_password(desired_length, include_lowercase, include_uppercase, include_numbers, include_symbols)
  print("Your generated password:", password)
end
