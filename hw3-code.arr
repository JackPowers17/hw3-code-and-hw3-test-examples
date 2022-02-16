use context essentials2021
include tables
include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
# Part 1

fun nickname-check(s :: String) -> Boolean:
  doc: "checks a nickname to see if it both starts and ends with diamond brackets, has a comma in the exact middle of the string, contains an a in the nickname, and does not contain the word [curse]"
  if s == "": false
  else if ((string-char-at(s, 0) == "<") and (string-char-at(s, (string-length(s) - 1)) == ">")) and ((not(num-modulo((string-length(s)), 2) == 0) and (string-char-at(s, ((string-length(s) / 2) - 0.5)) == ",")) and (string-contains(s, "a"))): true
  else if string-contains(s, "curse"): false
  else: false
  end
where: 
  nickname-check("<brody,tanly>") is true
  nickname-check("<brody,steve>") is false
  nickname-check("brody,tanly>") is false
  nickname-check("<brody,tan>") is false
  nickname-check("<brody,tanly") is false
  nickname-check("<brody tanly>") is false
  nickname-check("<brody,curse>") is false
  nickname-check("<brac,urse>") is true
  nickname-check("<broseph,cursesy>") is false
end
# Part 2 (gradescope only allows me to submit one file, but hw3-tests-examples is in my gradescope submission history for hw3)

# Part 3
#use context essentials2021
# Global Advertisment Targets
TARGET-AGE = 25
TARGET-TOWN = "oatman"
TARGET-ELECTRONICS = "pearPods, pearTunes, pearPad, pearPod touch"

CUSTOMERS = table: age :: Number, town :: String, device :: String, has-car :: Boolean 
  row: 21, "oatman", "pearPods", false 
  row: 21, "kingman", "pearTunes", true 
  row: 21, "kingman", "pearPods", false  
  row: 21, "providence", "pearPod Touch", true  
  row: 18, "oatman", "pearPad", true  
  row: 21, "oatman", "alexa", true
end

fun within-5(num :: Number) -> Boolean:
  doc: ```Determines whether the target age and a customer's age are within 5 of each other, 
       inclusive```
  (5 - num-abs(TARGET-AGE - num)) >= 0
end

fun device-relates(device :: String) -> Boolean:
  doc: ```determines whether the input string is a part of 
  TARGET-ELECTRONICS global variable```
  string-contains(TARGET-ELECTRONICS, device)
end

fun in-area(town :: String) -> Boolean:
  doc: ```determine whether a given town is in the Oatman surrounding area```
  (town == "kingman") or (town == "needles") or 
  (town == "oatman") or (town == "east topock")
end

fun in-range(town :: String, has-car :: Boolean) -> Boolean:
  doc: ```determine whether a person from a town can reach oatman. 
       this is possible if they live in oatman or if they live in 
       surrounding area and own a car```
  (in-area(town) and has-car) or (town == "oatman")
end
# 3 Part B
Customers2 = table: age :: Number, town :: String, device :: String, has-car :: Boolean 
  row: -1, "oatman", "", false 
  row: 21, "kingman", "", true 
  row: -1, "kingman", "pearPods", false  
  row: 21, "providence", "", true  
  row: -1, "oatman", "pearPad", true  
  row: 21, "oatman", "pearPods", true
end

fun show-ad(r :: Row) -> Boolean:
  doc: "determines whether to show an ad based on age, favorite electronic and location. Blank cases for age and devices are immediately registered as false as values that do not correspond to the specific parameters laid out initially are intended to not be shown to customers"
  if (r["age"] == -1) or (r["device"] == ""): false
  else if ((((5 - num-abs(TARGET-AGE - r["age"])) >= 0) and ((r["town"] == "kingman") or (r["town"] == "needles") or (r["town"] == "oatman") or (r["town"] == "east topock"))) and ((string-contains(TARGET-ELECTRONICS, r["device"])) and ((in-area(r["town"]) and r["has-car"]) or (r["town"] == "oatman")))): true
  else: false  
end
where:
  show-ad(Customers2.row-n(0)) is false
  show-ad(Customers2.row-n(1)) is false
  show-ad(Customers2.row-n(2)) is false
  show-ad(Customers2.row-n(3)) is false
  show-ad(Customers2.row-n(4)) is false
  show-ad(Customers2.row-n(5)) is true
  show-ad(CUSTOMERS.row-n(0)) is true
  show-ad(CUSTOMERS.row-n(1)) is true
  show-ad(CUSTOMERS.row-n(2)) is false
  show-ad(CUSTOMERS.row-n(3)) is false
  show-ad(CUSTOMERS.row-n(4)) is false
  show-ad(CUSTOMERS.row-n(5)) is false
end
# While you could also include a line that immediately registers all blank values for has-car as false, this could undermine the function, as those living in the town of oatman do not require a car to be shown the ad, and are also not penalized for having one. Having the function immediately read blank values of has-car as false at the start of the function may weed out potential customers who's car status does not matter

# 2 hours

check "functions exist and have correct inputs": 
  t1 = table: age :: Number, town :: String, device :: String, has-car :: Boolean 
    row: 0, "", "", false 
  end
  nickname-check("") is false
  show-ad(t1.row-n(0))
end