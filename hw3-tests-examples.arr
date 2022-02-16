include my-gdrive("hw3-code-ignore.arr")

# DO NOT CHANGE ANYTHING ABOVE THIS LINE

# write your tests for resume-ranker in a check block here

check:
  resume-ranker("manager") is 0
  resume-ranker("social media manager") is 3
  resume-ranker("social-media manager") is 0
  resume-ranker("artistic") is 0
  resume-ranker("social media marketing") is 5
  resume-ranker("marketer") is 0
  resume-ranker("Marketing") is 5
  resume-ranker("aspiring artist") is 4
  resume-ranker("aspiring Artist") is 4 
end