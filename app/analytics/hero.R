tr2<<-NULL

strong_weak_topic <- function(data){
  if(is.null(data))
    return(c("failed"))
  
  flat<-data %>% filter(data$result$verdict =='OK')
  tr <- as.data.frame(select(flat$result$problem , rating, tags))
  tr2 <<- separate_rows(tr, tags, sep ="^, $") %>% group_by(tags) %>% summarise(mean_rating = mean(rating))
   tr2<<- mutate(tr2 , hero = case_when(
    mean_rating <=1199 ~ "Newbie",
    1200<=mean_rating & mean_rating <=1399 ~ "Pupil",
    1400<=mean_rating & mean_rating <=1599 ~ "Specialist",
    1600<=mean_rating & mean_rating <=1899 ~ "Expert",
    1900<=mean_rating & mean_rating <=2099 ~ "Candidate Master",
    2100<=mean_rating & mean_rating <=2299 ~ "Master",
    2300<=mean_rating & mean_rating <=2399 ~ "International Master",
    2400<=mean_rating & mean_rating <=2599 ~ "GrandMaster",
    2600<=mean_rating & mean_rating <=2999 ~ "International GrandMaster",
    3000<=mean_rating  ~ "Lengendary GrandMaster",
  ))
  return(as.list(tr2$tags))
}
heroFunction <- function(problemTag)
{
  
  check = tryCatch({
    if(problemTag!="failed" && problemTag!="sad")
    { 
      
      HT <- filter(tr2 , tags == problemTag)
      HT<- HT$hero
      
    }
    else
    {
      HT <- "nodata"
    }
    print(HT)

    if(HT == "Newbie")
      return(str_c("2 ",HT))
    else if(HT == "pupil")
      return(str_c("3 ",HT))
    else if(HT == "Specialist")
      return(str_c("4 ",HT))
    else if(HT == "Expert")
      return(str_c("5 ",HT))
    else if(HT == "Candidate Master")
      return(str_c("6 ",HT))
    else if(HT == "International Master")
      return(str_c("7 ",HT))
    else if(HT == "GrandMaster")
      return(str_c("8 ",HT))
    else if(HT == "Master")
      return(str_c("9 ",HT))
    else if(HT == "International GrandMasterster")
      return(str_c("10 ",HT))
    else
      return(str_c("11 ",HT))
  },  error = function(e){
    
    print(HT)
    print(e)
  })
  
 
  
}




