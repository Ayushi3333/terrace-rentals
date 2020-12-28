def full_name(first_name, last_name)
  if first_name.nil? && last_name.nil?
    nil
  elsif last_name.nil?
    "#{first_name.capitalize}"
  else
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
