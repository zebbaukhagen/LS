def repeat(string, num)
  if num >= 0
    num.times { puts string }
  end
  nil
end

repeat('Hello', 3)
