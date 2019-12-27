# Reformat fieldbook

source("cnfg/setup.r")

sheets_auth(T)
url <- "https://docs.google.com/spreadsheets/d/1gue-wSQcEu4nJigVZdUWsTfIIzhtxpDRdWAQiEHgKak/edit#gid=1437032568"
gs <- as_sheets_id(url)
# browseURL(url)

dic <- gs %>% 
  sheets_read("var_old")

fbp <- gs %>% 
  sheets_read("fb_old") %>% 
  metamorphosis(fieldbook = ., 
                dictionary = dic, 
                from = "old_name", 
                to = "Abbreviation", 
                index = "Type",
                colnames = c("colname"))

fb <- fbp$fieldbook %>% 
  gather(-plots, -smp, -block, -imb, -imbt, 
         key =  "var",
         value =  "val") %>% 
  unite(var, smp, col = "var", sep = "_") %>% 
  select(-plots) %>% 
  spread(var, val) %>% 
  select(block, imb, imbt, 
         sch_0_1,
         sch_0_2,
         sch_0_3,
         hpt_0_1,
         elc_0_1,
         tct_0_1,
         sfw_0_1,
         stw_0_1,
         sdw_0_1,
         smt_0_1,
         swc_0_1,
         nseed_0_1,
         sgr_0_1,
         sgr_1_1,
         sgr_2_1,
         sgr_3_1,
         sgr_4_1,
         sgr_5_1,
         sgr_6_1,
         sgr_7_1,
         sgr_8_1,
         sgr_9_1,
         sgr_10_1,
         sgr_11_1,
         sgr_12_1,
         sgr_13_1,
         sgr_14_1,
         sgr_15_1,
         sgr_16_1,
         sgr_17_1,
         sgr_18_1,
         sgr_19_1,
         sgr_20_1,
         sgr_21_1,
         sgr_22_1,
         sgr_23_1,
         sgr_24_1,
         sgr_25_1)

fbd <- gs %>% 
  sheets_read("flb") 

ffb <- fbd %>% 
  full_join(x = ., y = fb, 
            by = c("block", "imb")) %>% 
  select(-imbt.y) %>% 
  rename(imbt = imbt.x)
  
write.csv(ffb, file = "files/nfb.csv")

  

