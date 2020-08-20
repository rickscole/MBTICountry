# import libraries
library(rvest)
library(stringr)

# define functions
ExtractNumber <- function(NumberString)
{ 
  str_extract(NumberString, "\\-*\\d+\\.*\\d*")
} 
ZeroIfMissing <- function(NullableValue,DefaultArray){
  if(is.na(NullableValue)){
    ReturnArray = rep(0,times = length(DefaultArray))
  }else{
    ReturnArray = abs(NullableValue - DefaultArray)
  }
}

# define arrays
Countries = c("afghanistan","albania","algeria","andorra","angola","antigua-and-barbuda","argentina","armenia","australia","austria","azerbaijan","bahamas","bahrain","bangladesh","barbados","belarus","belgium","belize",
              "bhutan","bolivia","bosnia-and-herzegovina","botswana","brazil","brunei","bulgaria","burkina-faso","ivory-coast",
              "cambodia","cameroon","canada",
              "chile","china","colombia",
              "congo","costa-rica","croatia","cuba","cyprus","czech-republic",
              "denmark","djibouti","dominica","dominican-republic","ecuador","egypt","el-salvador",
              "estonia","swaziland","ethiopia","fiji","finland","france",
              "georgia","germany","ghana","greece","grenada","guatemala",
              "guyana","haiti",
              "honduras","hungary","iceland","india","indonesia","iran","iraq","ireland","israel","italy","jamaica","japan","jordan","kazakhstan","kenya",
              "kuwait","kyrgyzstan","laos","latvia","lebanon","lesotho",
              "libya",
              "lithuania","luxembourg","madagascar","malawi","malaysia","maldives","mali","malta",
              "mauritius","mexico","moldova","monaco","mongolia","montenegro","morocco","mozambique","myanmar-burma","namibia",
              "nepal","netherlands","new-zealand","nicaragua","nigeria",
              "macedonia",
              "norway","oman","pakistan",
              "palestine","panama","papua-new-guinea","paraguay","peru","philippines","poland","portugal","qatar","romania","russia",
              "saint-kitts-and-nevis","saint-lucia","saint-vincent-and-the-grenadines",
              "saudi-arabia","senegal","serbia","seychelles",
              "singapore","slovakia","slovenia",
              "somalia","south-africa","republic-of-korea","spain","sri-lanka","sudan","suriname","sweden","switzerland","syria","tajikistan","tanzania","thailand",
              "trinidad-and-tobago","tunisia","turkey",
              "uganda","ukraine","united-arab-emirates","united-kingdom","united-states","uruguay","uzbekistan","vanuatu","venezuela","vietnam","yemen","zambia","zimbabwe")
Countries_Length = length(Countries)
Country_I = rep(NA,times = Countries_Length)
Country_N = rep(NA,times = Countries_Length)
Country_T = rep(NA,times = Countries_Length)
Country_P = rep(NA,times = Countries_Length)
Country_A = rep(NA,times = Countries_Length)

# loop through countries and get MBTI info
Index_Countries = 1
while(Index_Countries <= Countries_Length){
  Country = Countries[Index_Countries]
  print(Index_Countries)
  URL = paste('https://www.16personalities.com/country-profiles/',Country,sep="")
  Webpage = read_html(URL)
  Rank_Data_HTML = html_nodes(Webpage,'.with-border')
  Rank_Data <- html_text(Rank_Data_HTML)
  Country_IorE = Rank_Data[2]
  Country_NorS = Rank_Data[4]
  Country_TorF = Rank_Data[6]
  Country_PorJ = Rank_Data[8]
  Country_AorT = Rank_Data[10]
  Rank_Data_HTML = html_nodes(Webpage,'.point')
  Rank_Data <- html_text(Rank_Data_HTML)
  
  # introversion
  DimensionValue = as.numeric(ExtractNumber(Rank_Data[1]))
  if(Country_IorE == 'Introverted')
  {
    Country_I[Index_Countries] = 50 + DimensionValue
  }
  else
  {
    Country_I[Index_Countries] = 50 - DimensionValue
  }
  
  # intution
  DimensionValue = as.numeric(ExtractNumber(Rank_Data[2]))
  if(Country_NorS == 'Intuitive')
  {
    Country_N[Index_Countries] = 50 + DimensionValue
  }
  else
  {
    Country_N[Index_Countries] = 50 - DimensionValue
  }
  
  # thinking
  DimensionValue = as.numeric(ExtractNumber(Rank_Data[3]))
  if(Country_TorF == 'Thinking')
  {
    Country_T[Index_Countries] = 50 + DimensionValue
  }
  else
  {
    Country_T[Index_Countries] = 50 - DimensionValue
  }
  
  # prospecting
  DimensionValue = as.numeric(ExtractNumber(Rank_Data[4]))
  if(Country_PorJ == 'Prospecting')
  {
    Country_P[Index_Countries] = 50 + DimensionValue
  }
  else
  {
    Country_P[Index_Countries] = 50 - DimensionValue
  }
  
  # turbulence
  DimensionValue = as.numeric(ExtractNumber(Rank_Data[5]))
  if(Country_AorT == 'Assertive')
  {
    Country_A[Index_Countries] = 50 + DimensionValue
  }
  else
  {
    Country_A[Index_Countries] = 50 - DimensionValue
  }
  
  Index_Countries = Index_Countries + 1
}
CountryMBTI = cbind(Country_I,Country_N,Country_T,Country_P,Country_A)