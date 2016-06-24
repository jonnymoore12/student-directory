def method;
   "def method;;end;puts method()[0,11] + 34.chr + method + 34.chr + method()[11..-1]";
end;

puts method()[0,11] + 34.chr + method + 34.chr + method()[11..-1]
