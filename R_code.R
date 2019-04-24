 


  #Read CSV file
  addsToCart <- read.csv("C:/Users/Satyam/Downloads/addsToCart.csv")
  View(addsToCart)
  sessionCounts <- read.csv("C:/Users/Satyam/Downloads/sessionCounts.csv")
  View(sessionCounts)
  
  #check if there is any duplicate record
  View(unique(sessionCounts))
  
  summary(sessionCounts)
  #summary of categorical variables
  table(sessionCounts$dim_browser)
  table(sessionCounts$dim_deviceCategory)
  
  #Extract month from dates
  sessionCounts['month']<-format(as.Date(sessionCounts$dim_date), "%m")
  View(sessionCounts)

  #group by month and device category
  gr=sessionCounts %>% 
    +     group_by(month,dim_deviceCategory) %>% 
    +     summarise (Sessions = sum(sessions),Transactions=sum(transactions),QTY=sum(QTY)) 
  View(gr)

  #Calculate ECR for the data
  gr['ECR']<-gr$Transactions/gr$Sessions
  View(gr)

  #Assign names to columns as in output
  names(gr) <- c("Month", "Device Category","Sessions","Transactions","QTY","ECR")
  View(gr)

  # Group by month for add to cart data frame
  gr2=sessionCounts %>% 
  +     group_by(month) %>% 
  +     summarise (Sessions = sum(sessions),Transactions=sum(transactions),QTY=sum(QTY)) 
  View(gr2)

  # Calculate ECR for the data
  gr2['ECR']<-gr2$Transactions/gr2$Sessions
  View(gr2)

  #Merge addsToCart column with the new data frame gr2 
  gr2['Adds To Cart']<-addsToCart$addsToCart

  #Add new Column Device Category 
  gr2['Device Category']<-"Overall"
  View(gr2)

  #Assign names to columns as in output
  names(gr2) <- c("Month","Sessions","Transactions","QTY","ECR","Adds To Cart","Device Category")

 
  install.packages("openxlsx")

  #Create output.xlsx file
  wb <- createWorkbook("output.xlsx")
 
  #Add 2 sheets and data to the output workbook
  addWorksheet(wb, "Month x Device", gridLines = FALSE)
  addWorksheet(wb, "Month Summary", gridLines = FALSE)
  writeData(wb, sheet = 1, gr)
  writeData(wb, sheet = 2, gr2)
  
  #Create the style with desired font size, color and border
  headerStyle <- createStyle(fontSize = 11,fgFill = "gray90", border="Bottom",textDecoration ="bold",wrapText = TRUE)
  
  #Add the style to the desired rows and columns in the worksheets
  addStyle(wb, sheet = 1, headerStyle, rows = 1, cols = 1:6)
  addStyle(wb, sheet = 2, headerStyle, rows = 1, cols = 1:7)
  
  #save the workbook
  saveWorkbook(wb, "output.xlsx", overwrite = TRUE)
  
