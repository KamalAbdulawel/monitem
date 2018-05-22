library(htmltools);library(shiny);library(shinydashboard);library(data.table);library(ggplot2);
library(gridExtra);library(readr);library(ionicons);library(leaflet);library(plotly)
library(dplyr);library(mailR);library(rJava);library(ionicons);library(tseries);library(forecast);library(shinyAce);library(mail)
library(ggfortify)


# Datenbankverbindung wird hergestellt

localdb <- src_postgres(dbname = 'postgres', host = 'localhost', port = '5432', user = 'postgres',
  password = 'roggendorf1710')
  
# Aktuelle Sensordaten werden abgefragt  
lastdatatable = function() {query = "select* from activitymonitem,test
  where timestamp = test.max"
temp = tbl(localdb, sql(query)) %>% collect() 
temp
}

tsseries <- function() {
  query = "select * from ts
  limit 50"
  temp3 = tbl(localdb, sql(query)) %>% collect()
  temp3
}

tsseries2 <- function() {
  query = "select * from ts2
  limit 50"
  temp3 = tbl(localdb, sql(query)) %>% collect()
  temp3
}
tsseries3 <- function() {
  query = "select * from ts3
  limit 50"
  temp3 = tbl(localdb, sql(query)) %>% collect()
  temp3
}

  
tsdatatable <- function() {
  query = "select * from  datatable"
  temp3 = tbl(localdb, sql(query)) %>% collect()
  temp3
}
  
lastdatawarning= function() {
  query3 = "select distinct predict,longitude,latitude,sensorid,adresse,
  recommendation,store,timestamp
  FROM activitymonitem,test where timestamp = test.max
  and predict = 'warning'" 
  temp3 = tbl(localdb, sql(query3)) %>% collect()
}

lastdataok= function() {
  query4 = "select  predict,longitude,latitude,sensorid,adresse,
  recommendation,store,timestamp,locat
  FROM activitymonitem,test where timestamp = test.max
  and predict = 'allfine'" 
  temp4 = tbl(localdb, sql(query4)) %>% collect()
  temp4
}
lastdatamaintenance=function() { 
  query1 = "select * from testdata33"  
  temp1 = tbl(localdb, sql(query1)) %>% collect()  
  temp1
}

lastdatafailed = function(){
  query2 = "select  predict,longitude,latitude,sensorid,adresse,
  recommendation,store,timestamp
  FROM activitymonitem,test where timestamp = test.max
  and predict = 'signalmissing'" 
  temp2 = tbl(localdb, sql(query2)) %>% collect()
  temp2
}

 #----------------------------------------------------
 
 
 
 fNormaw = function() { 
   query = "select * from contentnormawarning" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 
 fNormawa = function() { 
   query = "select * from contentnormawartung" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 
 fNormasm = function() { 
   query = "select * from contentnormasignalmissing" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 
 fNormaaf = function() { 
   query = "select * from contentnormaallfine" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 #------------------------------------------------------------------------
 
 
 
 fAldiaf = function() { 
   query = "select * from contentaldiallfine" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 
 fAldiw = function() { 
   query = "select * from contentaldiwarning" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 fAldiwa = function() { 
   query = "select * from contentaldiwartung" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 fAldism = function() { 
   query = "select * from contentaldisignalmissing" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
#------------------------------------------------------------------- 
 
 
   fEdekaaf = function() { 
     query = "select * from contentedekaallfine" 
     temp = tbl(localdb, sql(query)) %>% collect()  
     temp
   }
 
 
 fEdekasm = function() { 
   query = "select * from contentedekasignalmissing" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 
 fEdekaw = function() { 
   query = "select * from contentedekawarning" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 fEdekawa = function() { 
   query = "select * from contentedekawartung" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
#----------------------------------------------------------------------- 
 
 fPennysm = function() { 
     query = "select * from contentpennysignalmissing" 
     temp = tbl(localdb, sql(query)) %>% collect()  
     temp
   }
 fPennyaf = function() { 
   query = "select * from contentpennyallfine" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 fPennywa = function() { 
   query = "select * from contentpennywartung" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 fPennyw = function() { 
   query = "select * from contentpennywarning" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
# -------------------------------------------------------------
 
   fBockenheimw= function() { 
     query = "select * from contentbockenheimwarning" 
     temp = tbl(localdb, sql(query)) %>% collect()  
     temp
   }
 
 fBockenheimwa= function() { 
   query = "select * from contentbockenheimwartung" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 fBockenheimaf= function() { 
   query = "select * from contentbockenheimallfine" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 fBockenheimsm= function() { 
   query = "select * from contentbockenheimsignalmissing" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 #------------------------------------------------------------------
 
   
   fSachsenhausenw= function() { 
     query = "select * from contentsachswarning" 
     temp = tbl(localdb, sql(query)) %>% collect()  
     temp
   }
 
 fSachsenhausenwa= function() { 
   query = "select * from contentsachswartung" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 
 fSachsenhausenaf= function() { 
   query = "select * from contentsachsallfine" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 
 fSachsenhausensm= function() { 
   query = "select * from contentsachssignalmissing" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
#---------------------------------------------------------------------
   
   
   fRiederwaldw= function() { 
     query = "select * from contentriederwaldwarning" 
     temp = tbl(localdb, sql(query)) %>% collect()  
     temp
   }
   
 fRiederwaldwa= function() { 
   query = "select * from contentriederwaldwartung" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 
 fRiederwaldaf= function() { 
   query = "select * from contentriederwaldallfine" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 
 
 
 fRiederwaldsm= function() { 
   query = "select * from contentriederwaldsignalmissing" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
#-------------------------------------------------------------------------- 
 
 
 fOberradw= function() { 
   query = "select * from contentoberradwarning" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 
 fOberradwa= function() { 
   query = "select * from contentoberradwartung" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 fOberradaf= function() { 
   query = "select * from contentoberradllfine" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 
 fOberradsm= function() { 
   query = "select * from contentoberradsignalmissing" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
#------------------------------------------------------------------- 
 
 fStadtzentrumw= function() { 
   query = "select * from contentcitywarning" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 fStadtzentrumwa= function() { 
   query = "select * from contentcitywartung" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 fStadtzentrumaf= function() { 
   query = "select * from contentcityallfine" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 fStadtzentrumsm= function() { 
   query = "select * from contentcitysignalmissing" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
#--------------------------------------------------------------------------- 
 
 
 fFechenheimw= function() { 
   query = "select * from contentfechenheimwarning" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 fFechenheimwa= function() { 
   query = "select * from contentfechenheimwartung" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 fFechenheimaf= function() { 
   query = "select * from contentfechenheimallfine" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
 fFechenheimsm= function() { 
   query = "select * from contentfechenheimsignalmissing" 
   temp = tbl(localdb, sql(query)) %>% collect()  
   temp
 }
 
#------------------------------------------------------------------ 
 
 
 
 # PrÃÂ¼ft ob neue Daten eingegangen sind

testfunction <- function() {
  query = "select max(timestamp) from activitymonitem"
  df = tbl(localdb, sql(query)) %>% collect()
  df$max
}

 testfunctiontsseries<- function() {
   query = "select max(timestamp) from zeitreihen"
   df = tbl(localdb, sql(query)) %>% collect()
   df$max
 }




shinyServer(function(input, output,session) {

# In einem Zeitabstand von 100 ms wird die testfunction aufgerufen, wenn diese einen verÃÂ¤nderten zeitstemple zurÃÂ¼ckgibt
 # werden neue Daten abgerufen
  tesseries2 <- reactivePoll(100, session,testfunctiontsseries,tsseries2 )
  tesseries3 <- reactivePoll(100, session,testfunctiontsseries,tsseries3 )
  tesseries <- reactivePoll(100, session,testfunctiontsseries,tsseries )
  tesdata <- reactivePoll(100, session, testfunction,lastdatawarning )
  tesdata1 <- reactivePoll(100, session, testfunction,lastdatafailed )
  tesdata2 <- reactivePoll(100, session, testfunction,lastdatamaintenance )
  tesdata3 <- reactivePoll(100, session, testfunction,lastdataok )
# ----------------------------------Markers Norma-------------------------------- 
  tesnormaw <- reactivePoll(100, session, testfunction, fNormaw)
  tesnormawa <- reactivePoll(100, session, testfunction,fNormawa )
  tesnormaaf <- reactivePoll(100, session, testfunction,fNormaaf )
  tesnormasm <- reactivePoll(100, session, testfunction,fNormasm )
#-----------------------------------Markers Aldi------------------------------------
  tesaldiw <- reactivePoll(100, session, testfunction,fAldiw )
  tesaldiwa <- reactivePoll(100, session, testfunction, fAldiwa)
  tesaldiaf <- reactivePoll(100, session, testfunction,fAldiaf )
  tesaldism <- reactivePoll(100, session, testfunction,fAldism )
#--------------------------------Markers Edeka---------------------------------------
  tesedekaw <- reactivePoll(100, session, testfunction,fEdekaw )
  tesedekawa <- reactivePoll(100, session, testfunction,fEdekawa )
  tesedekaaf <- reactivePoll(100, session, testfunction, fEdekaaf)
  tesedekasm <- reactivePoll(100, session, testfunction,fEdekasm )
#--------------------------------Markers Penny-------------------------------------------
  tespennyw <- reactivePoll(100, session, testfunction,fPennyw )
  tespennywa <- reactivePoll(100, session, testfunction,fPennywa )
  tespennyaf <- reactivePoll(100, session, testfunction,fPennyaf )
  tespennysm <- reactivePoll(100, session, testfunction, fPennysm)
#-------------------------------Markers Bockenheim-----------------------------------------  
  
  tesbockenheimw <- reactivePoll(100, session, testfunction,fBockenheimw )
  tesbockenheimwa <- reactivePoll(100, session, testfunction,fBockenheimwa )
  tesbockenheimaf <- reactivePoll(100, session, testfunction,fBockenheimaf )
  tesbockenheimsm<- reactivePoll(100, session, testfunction,fBockenheimsm )
#------------------------------Markers Fechenheim------------------------------------
  
  tesfechenheimw <- reactivePoll(100, session, testfunction,fFechenheimw )
  tesfechenheimwa <- reactivePoll(100, session, testfunction,fFechenheimwa )
  tesfechenheimaf <- reactivePoll(100, session, testfunction,fFechenheimaf )
  tesfechenheimsm<- reactivePoll(100, session, testfunction,fFechenheimsm)
  
  #-----------------------------Markers Oberrad-------------------------------------------
  
  tesoberradw <- reactivePoll(100, session, testfunction,fOberradw )
  tesoberradwa <- reactivePoll(100, session, testfunction,fOberradwa )
  tesoberradaf <- reactivePoll(100, session, testfunction,fOberradaf )
  tesoberradsm <- reactivePoll(100, session, testfunction,fOberradsm )
  
  #------------------------------Markers Sachsenhausen-------------------------------
  tessachsw <- reactivePoll(100, session, testfunction,fSachsenhausenw )
  tessachswa <- reactivePoll(100, session, testfunction,fSachsenhausenwa )
  tessachsaf <- reactivePoll(100, session, testfunction,fSachsenhausenaf )
  tessachssm <- reactivePoll(100, session, testfunction,fSachsenhausensm)
  
  #------------------------------Markers Riederwald------------------------------------
  
  tesriederwaldw <- reactivePoll(100, session, testfunction,fRiederwaldw )
  tesriederwaldwa <- reactivePoll(100, session, testfunction,fRiederwaldwa )
  tesriederwaldaf <- reactivePoll(100, session, testfunction,fRiederwaldaf )
  tesriederwaldsm <- reactivePoll(100, session, testfunction,fRiederwaldsm )
  
#-------------------------------Markers Stadtmitte-------------------------------------
  tescityw <- reactivePoll(100, session, testfunction,fStadtzentrumw )
  tescitywa <- reactivePoll(100, session, testfunction,fStadtzentrumwa )
  tescityaf <- reactivePoll(100, session, testfunction,fStadtzentrumaf )
  tescitysm <- reactivePoll(100, session, testfunction,fStadtzentrumsm )
  
#-------------------Content der Karte zur Initialisierung wird erzeugt--------------------------------------- 
  
  
    content <- paste0("<strong>Store: </strong>",lastdatawarning()$store,"<br><strong>SensorID: </strong>",
    lastdatawarning()$sensorid,"<br><strong>Location: </strong>",lastdatawarning()$adresse,  "<br><strong>Event: </strong>",
    lastdatawarning()$predict,"<br><strong>Action: </strong>", lastdatawarning()$recommendation,  "<br><strong>Date: </strong>",
    lastdatawarning()$timestamp    
  )
  
   content1 <- paste0("<strong>Store: </strong>",lastdatamaintenance()$store,"<br><strong>SensorID: </strong>",
    lastdatamaintenance()$sensorid,"<br><strong>Location: </strong>",lastdatamaintenance()$adresse,  "<br><strong>Event: </strong>",
    lastdatamaintenance()$predict,"<br><strong>Action: </strong>", lastdatamaintenance()$recommendation,  "<br><strong>Date: </strong>",
    lastdatamaintenance()$timestamp    
  )
  
   content2 <- paste0("<strong>Store: </strong>",lastdatafailed()$store,"<br><strong>SensorID: </strong>",
    lastdatafailed()$sensorid,"<br><strong>Location: </strong>",lastdatafailed()$adresse,  "<br><strong>Event: </strong>",
    lastdatafailed()$predict,"<br><strong>Action: </strong>", lastdatafailed()$recommendation,  "<br><strong>Date: </strong>",
    lastdatafailed()$timestamp    
  )
  
   content3 <- paste0("<strong>Store: </strong>",lastdataok()$store,"<br><strong>SensorID: </strong>",
    lastdataok()$sensorid,"<br><strong>Location: </strong>",lastdataok()$adresse,  "<br><strong>Event: </strong>",
    lastdataok()$predict,"<br><strong>Action: </strong>", lastdataok()$recommendation,  "<br><strong>Date: </strong>",
    lastdataok()$timestamp  
  )
	

  #---------------------------------Marker Icons werden erzeugt-------------------------------------------------------------------- 
   
   iconred <-awesomeIcons( library = 'ion',
                           markerColor = 'red',
                           icon = ''
                           
   ) 
   icongreen<-awesomeIcons( library = 'ion',
                           markerColor = 'darkgreen',
                           icon = ''
                           
   ) 
   iconblue <-awesomeIcons( library = 'ion',
                           markerColor = 'darkblue',
                           icon = ''
                           
   ) 
   iconorange <-awesomeIcons( library = 'ion',
                           markerColor = 'orange',
                           icon = ''
                           
   ) 

   
   iconred <-awesomeIcons( library = 'ion',
                              markerColor = 'red',
                           icon = ''  ) 
	
  
#--------------------------- Karte wird erzeugt-----------------------------------------------
  
output$mymap <- renderLeaflet({
top = 50.1606
bottom = 50.0686
right = 8.7970
left = 8.6373

leaflet() %>%
addProviderTiles(providers$CartoDB.Positron)%>%#setView(left,top,right, bottom)%>%
setView( lng =  8.6820917, lat = 50.1106444, zoom = 12)%>%  
addLegend("bottomright", colors =c("#8b0000",  "#006400", "#00008b", "#ff8c00"), labels= c("W", "AF","WA","SM"))%>%
addAwesomeMarkers(lng = lastdatawarning()$longitude, lat = lastdatawarning()$latitude,popup = content, icon = iconred )%>%
addAwesomeMarkers(lng = lastdatamaintenance()$longitude, lat = lastdatamaintenance()$latitude,popup = content1, icon = iconblue)%>%
addAwesomeMarkers(lng = lastdataok()$longitude, lat = lastdataok()$latitude,popup = content3, icon = icongreen)%>%
addAwesomeMarkers(lng = lastdatafailed()$longitude, lat = lastdatafailed()$latitude,popup = content2, icon = iconorange)


})

  
		
  
  
  #---------------------------------------------------------------Dynamischer Content Events--------------------------------------------- 
    
    contentreac <- reactive ({
      data = tesdata()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                        data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                        data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                        data$timestamp    
                        
                       
      )})
   
    content1reac <- reactive ({
      data = tesdata2()
      
      content1 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                        data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                        data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                        data$timestamp    
      )})
    
    
   content2reac <- reactive({
      data = tesdata1()
      
      content2 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                        data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                        data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                        data$timestamp    
      )})
    
    content3reac <- reactive ({
      data = tesdata3()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                        data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                        data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                        data$timestamp    
      )})
    
 #----------------------Dynamische Inhalte Popup Norma---------------------------------------------------------     
    
    contentreacnormaw <- reactive ({
      data = tesnormaw()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    contentreacnormawa <- reactive ({
      data = tesnormawa()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    contentreacnormaaf <- reactive ({
      data = tesnormaaf()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    
    contentreacnormasm <- reactive ({
      data = tesnormasm()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
#  -------------------------------------  Dynamische Inhalte Popup Aldi-----------------------------------------
    
    
    
    contentreacaldiw <- reactive ({
      data = tesaldiw()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    contentreacaldiwa <- reactive ({
      data = tesaldiwa()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    
    contentreacaldiaf <- reactive ({
      data = tesaldiaf()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    contentreacaldism <- reactive ({
      data = tesaldism()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    
#---------------------------Dynamische Inhalte Popup Penny------------------------------------------------------     
    
    
    contentreacpennyw <- reactive ({
      data = tespennyw()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    contentreacpennywa <- reactive ({
      data = tespennywa()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    contentreacpennyaf <- reactive ({
      data = tespennyaf()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    
    contentreacpennysm <- reactive ({
      data = tespennysm()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    
#------------------------------Dynamische Inhalte Popup Edeka-----------------------------------------------     
    
    
    contentreacedekaw <- reactive ({
      data = tesedekaw()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    contentreacedekawa <- reactive ({
      data = tesedekawa()
      
      content3 <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    
    contentreacedekaaf <- reactive ({
      data = tesedekaaf()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    
    contentreacedekasm <- reactive ({
      data = tesedekasm()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    
#---------------------------------------Dynamische Inhalte Popup Bockenheim-------------------------------------    
    
    contentreacbockenheimw <- reactive ({
      data = tesbockenheimw()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    contentreacbockenheimwa <- reactive ({
      data = tesbockenheimwa()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    contentreacbockenheimaf <- reactive ({
      data = tesbockenheimaf()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    contentreacbockenheimsm <- reactive ({
      data = tesbockenheimsm()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    
    #---------------------------------------Dynamische Inhalte Popup Sachsenhausen-------------------------------------        
    
      contentreacsachsw <- reactive ({
      data = tessachsw()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    contentreacsachswa <- reactive ({
      data = tessachswa()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                             data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                             data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                             data$timestamp    
      )})
    
    contentreacsachsaf <- reactive ({
      data = tessachsaf()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                             data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                             data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                             data$timestamp    
      )})
    
    
    contentreacsachssm <- reactive ({
      data = tessachssm()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                             data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                             data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                             data$timestamp    
      )})
    
    
 #---------------------------------------Dynamische Inhalte Popup Oberrad-------------------------------------   
    
   contentreacoberradw <- reactive ({
      data = tesoberradw()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    contentreacoberradwa <- reactive ({
      data = tesoberradwa()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                             data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                             data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                             data$timestamp    
      )})
    
    
    contentreacoberradaf <- reactive ({
      data = tesoberradaf()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                             data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                             data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                             data$timestamp    
      )})
    
    contentreacoberradsm <- reactive ({
      data = tesoberradsm()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                             data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                             data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                             data$timestamp    
      )})
    
    
   #---------------------------------------Dynamische Inhalte Popup Stadtzentrum----------------------------------- 
    
    contentreaccityw <- reactive ({
      data = tescityw()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    contentreaccitywa <- reactive ({
      data = tescitywa()
      
      conten <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                            data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                            data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                            data$timestamp    
      )})
    
    contentreaccityaf <- reactive ({
      data = tescityaf()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                            data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                            data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                            data$timestamp    
      )})
    
    contentreaccitysm <- reactive ({
      data = tescitysm()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                            data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                            data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                            data$timestamp    
      )})
    
    
    #---------------------------------------Dynamische Inhalte Popup Riederwald----------------------------------- 
    
    
    contentreacriederwaldw <- reactive ({
      data = tesriederwaldw()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    contentreacriederwaldwa <- reactive ({
      data = tesriederwaldwa()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                             data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                             data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                             data$timestamp    
      )})
    
    
    
    contentreacriederwaldaf <- reactive ({
      data = tesriederwaldaf()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                             data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                             data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                             data$timestamp    
      )})
    
    
    
    contentreacriederwaldsm <- reactive ({
      data = tesriederwaldsm()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                             data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                             data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                             data$timestamp    
      )})
    
    #---------------------------------------Dynamische Inhalte Popup Fechenheim-----------------------------------     
    
    contentreacfechenheimw <- reactive ({
      data = tesfechenheimw()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                         data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                         data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                         data$timestamp    
      )})
    
    
    contentreacfechenheimwa <- reactive ({
      data = tesfechenheimwa()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                                  data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                                  data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                                  data$timestamp    
      )})
    
    
    contentreacfechenheimaf <- reactive ({
      data = tesfechenheimaf()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                                  data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                                  data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                                  data$timestamp    
      )})
    
    contentreacfechenheimsm <- reactive ({
      data = tesfechenheimsm()
      
      content <- paste0("<strong>Store: </strong>",data$store,"<br><strong>SensorID: </strong>",
                                  data$sensorid,"<br><strong>Location: </strong>",data$adresse,  "<br><strong>Event: </strong>",
                                  data$predict,"<br><strong>Action: </strong>", data$recommendation,  "<br><strong>Date: </strong>",
                                  data$timestamp    
      )})
    
  #-----------------------------Filter Maps--------------------------------------------------------  
    observe({  
      
     if ( input$in3 == "All"){
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tesdata()$longitude, lat = tesdata()$latitude,popup = contentreac(), icon = iconred )%>%
          addAwesomeMarkers(lng = tesdata2()$longitude, lat = tesdata2()$latitude,popup = content1reac(), icon = iconblue)%>%
          addAwesomeMarkers(lng = tesdata3()$longitude, lat = tesdata3()$latitude,popup = content3reac(), icon = icongreen)%>%
         addAwesomeMarkers(lng = tesdata1()$longitude, lat = tesdata1()$latitude,popup = content2reac(), icon = iconorange)
      }    
      
      if ( input$in3 == "Warnung"){
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tesdata()$longitude, lat = tesdata()$latitude,popup = contentreac(), icon = iconred )
      }
      
      if ( input$in3 == "Signal Missing"){  
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tesdata1()$longitude, lat = tesdata1()$latitude,popup = content2reac(), icon = iconorange)
      }  
      
      if ( input$in3 == "Wartung"){  
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tesdata2()$longitude, lat = tesdata2()$latitude,popup = content1reac(), icon = iconblue)  
      }
      
      if ( input$in3 == "All Fine") {
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tesdata3()$longitude, lat = tesdata3()$latitude,popup = content3reac(), icon = icongreen)   
      }
      
      if ( input$in2 == "Bockenheim"){
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tesbockenheimw()$longitude, lat = tesbockenheimw()$latitude,popup = contentreacbockenheimw(), icon = iconred )%>%
         addAwesomeMarkers(lng = tesbockenheimwa()$longitude, lat = tesbockenheimwa()$latitude,popup = contentreacbockenheimwa(), icon = iconblue )%>%
          addAwesomeMarkers(lng = tesbockenheimaf()$longitude, lat = tesbockenheimaf()$latitude,popup = contentreacbockenheimaf(), icon = icongreen )%>%
          addAwesomeMarkers(lng = tesbockenheimsm()$longitude, lat = tesbockenheimsm()$latitude,popup = contentreacbockenheimsm(), icon = iconorange )
          
          }
      
      if ( input$in2 == "Riederwald"){  
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tesriederwaldw()$longitude, lat = tesriederwaldw()$latitude,popup = contentreacriederwaldw(), icon = iconred)%>%
          addAwesomeMarkers(lng = tesriederwaldwa()$longitude, lat = tesriederwaldwa()$latitude,popup = contentreacriederwaldwa(), icon = iconblue)%>%
          addAwesomeMarkers(lng = tesriederwaldaf()$longitude, lat = tesriederwaldaf()$latitude,popup = contentreacriederwaldaf(), icon = icongreen)%>%
          addAwesomeMarkers(lng = tesriederwaldsm()$longitude, lat = tesriederwaldsm()$latitude,popup = contentreacriederwaldsm(), icon = iconorange)
          
          
          
          }  
      
      if ( input$in2 == "Sachsenhausen"){  
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tessachsw()$longitude, lat = tessachsw()$latitude,popup = contentreacsachsw(), icon = iconred)%>%
          addAwesomeMarkers(lng = tessachswa()$longitude, lat = tessachswa()$latitude,popup = contentreacsachswa(), icon = iconblue)%>%
          addAwesomeMarkers(lng = tessachsaf()$longitude, lat = tessachsaf()$latitude,popup = contentreacsachsaf(), icon = icongreen)%>%
          addAwesomeMarkers(lng = tessachssm()$longitude, lat = tessachssm()$latitude,popup = contentreacsachssm(), icon = iconorange)
            
      }
      
      if ( input$in2 == "Oberrad") {
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tesoberradw()$longitude, lat = tesoberradw()$latitude,popup = contentreacoberradw(), icon = iconred)%>% 
          addAwesomeMarkers(lng = tesoberradwa()$longitude, lat = tesoberradwa()$latitude,popup = contentreacoberradwa(), icon = iconblue)%>% 
          addAwesomeMarkers(lng = tesoberradaf()$longitude, lat = tesoberradaf()$latitude,popup = contentreacoberradaf(), icon = icongreen)%>% 
          addAwesomeMarkers(lng = tesoberradsm()$longitude, lat = tesoberradsm()$latitude,popup = contentreacoberradsm(), icon = iconorange)
      }
      
      if ( input$in2 == "Stadtzentrum"){  
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tescityw()$longitude, lat = tescityw()$latitude,popup = contentreaccityw(), icon = iconred)%>%
          addAwesomeMarkers(lng = tescitywa()$longitude, lat = tescitywa()$latitude,popup = contentreaccitywa(), icon = iconblue)%>%
          addAwesomeMarkers(lng = tescityaf()$longitude, lat = tescityaf()$latitude,popup = contentreaccityaf(), icon = icongreen)%>%
          addAwesomeMarkers(lng = tescitysm()$longitude, lat = tescitysm()$latitude,popup = contentreaccitysm(), icon = iconorange)
          
      }
      
      if ( input$in2 == "Fechenheim") {
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tesfechenheimw()$longitude, lat = tesfechenheimw()$latitude,popup = contentreacfechenheimw(), icon = iconred)%>%
          addAwesomeMarkers(lng = tesfechenheimwa()$longitude, lat = tesfechenheimwa()$latitude,popup = contentreacfechenheimwa(), icon = iconblue)%>%
          addAwesomeMarkers(lng = tesfechenheimaf()$longitude, lat = tesfechenheimaf()$latitude,popup = contentreacfechenheimaf(), icon = icongreen)%>%
          addAwesomeMarkers(lng = tesfechenheimsm()$longitude, lat = tesfechenheimsm()$latitude,popup = contentreacfechenheimsm(), icon = iconorange)
      }
      
      
   
      
      if ( input$in1 == "Aldi"){
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tesaldiw()$longitude, lat = tesaldiw()$latitude,popup = contentreacaldiw(), icon = iconred )%>%
          addAwesomeMarkers(lng = tesaldiwa()$longitude, lat = tesaldiwa()$latitude,popup = contentreacaldiwa(), icon = iconblue )%>%
          addAwesomeMarkers(lng = tesaldiaf()$longitude, lat = tesaldiaf()$latitude,popup = contentreacaldiaf(), icon = icongreen )%>%
          addAwesomeMarkers(lng = tesaldism()$longitude, lat = tesaldism()$latitude,popup = contentreacaldism(), icon = iconorange )
      }
      
      if ( input$in1 == "Norma"){  
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tesnormaw()$longitude, lat = tesnormaw()$latitude,popup = contentreacnormaw(), icon = iconred)%>%
          addAwesomeMarkers(lng = tesnormawa()$longitude, lat = tesnormawa()$latitude,popup = contentreacnormawa(), icon = iconblue)%>%
          addAwesomeMarkers(lng = tesnormaaf()$longitude, lat = tesnormaaf()$latitude,popup = contentreacnormaaf(), icon = icongreen)%>%
          addAwesomeMarkers(lng = tesnormasm()$longitude, lat = tesnormasm()$latitude,popup = contentreacnormasm(), icon = iconorange)
      }  
      
      if ( input$in1 == "Edeka"){  
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tesedekaw()$longitude, lat = tesedekaw()$latitude,popup = contentreacedekaw(), icon = iconred)%>% 
          addAwesomeMarkers(lng = tesedekawa()$longitude, lat = tesedekawa()$latitude,popup = contentreacedekawa(), icon = iconblue)%>% 
          addAwesomeMarkers(lng = tesedekaaf()$longitude, lat = tesedekaaf()$latitude,popup = contentreacedekaaf(), icon = icongreen)%>% 
          addAwesomeMarkers(lng = tesedekasm()$longitude, lat = tesedekasm()$latitude,popup = contentreacedekasm(), icon = iconorange)
      }
      
      if ( input$in1 == "Penny") {
        leafletProxy("mymap") %>%clearMarkers() %>%
          addAwesomeMarkers(lng = tespennyw()$longitude, lat = tespennyw()$latitude,popup = contentreacpennyw(), icon = iconred)%>%
          addAwesomeMarkers(lng = tespennywa()$longitude, lat = tespennywa()$latitude,popup = contentreacpennywa(), icon = iconblue)%>%
          addAwesomeMarkers(lng = tespennyaf()$longitude, lat = tespennyaf()$latitude,popup = contentreacpennyaf(), icon = icongreen)%>%
          addAwesomeMarkers(lng = tespennysm()$longitude, lat = tespennysm()$latitude,popup = contentreacpennysm(), icon = iconorange)
        
        
      }
      
    })
      
      
#-------------------------------------Reaktives versenden von EMail verschicken----------------------------------------      
    
observe({   
  
  dat <- lastdatawarning()
  
  if(length(dat$predict) > 5) 
    
    {

sender <- "monitemapplication@gmail.com "  
recipients <- c("abdulawelkamal@gmail.com")  
email <- send.mail(from = sender,to = recipients,subject="Subject of the email",
                  body = "Bitte Statusmeldungen auf Monitem verfolgen",
                 smtp = list(host.name = "aspmx.l.google.com", port = 25),
                   authenticate = FALSE,send = T)}}) 

#-------------------------------------Dynamisches Rendern der Tabelle------------------------------------------
  
     output$tbl <- DT::renderDataTable(
      tsdatatable() ,rownames = FALSE,
       extensions = c('Responsive', 'Buttons'),options = list(searchHighlight = TRUE,dom = 'Bfrtip',
        buttons = c('copy', 'csv', 'excel', 'pdf', 'print')))
  
  
  
 #----------------------------------------Event Counter-------------------------------------------------------------- 
  
  event2 <- eventReactive(input$gook, {
    dat <-  tesdata()$predict 
    count <- length(dat)
    dat2 <-  tesdata2()$predict 
    count2 <- length(dat)
    dat3 <-  tesdata3()$predict 
    count3 <- length(dat3)
    dat <-  tesdata1()$predict 
    count1 <- length(dat)
    
    tes <- paste0("W:",count,";WA:", count2,";SM:", count1, ";AF:",count3 )
    tes
    
  })
    
    
    
    
 #-------------------------------Event Counter Output Funktion-------------------------------------------------------- 
  
  output$event2 <- renderText({ 
    
   event2()
    
   
  })
  
 #---------------------------------------------------------------------------------------------------------------------
  
    
    output$TS<-renderPlot({  
      
      y2 <- tesseries2()
      y3 <- tesseries3()
      y <-  tesseries()
      
      x <-  seq(1:50)
      
      tss <-  y [[1]]
      tss2 <- y2[[1]]
      tss3 <- y3[[1]]
     
      
      tss <- as.numeric(as.character(tss))
      tss2 <-as.numeric(as.character(tss2))
      tss3 <-as.numeric(as.character(tss3))
      
      data=  data.frame(x,tss,tss2,tss3)
    
      
      g1 <- ggplot()+
                   geom_line(data = data, aes(x,y=tss))+
                   geom_line(data = data, aes(x,y= tss2), colour = "green")+
                   geom_line(data = data, aes(x,y= tss3), colour = "blue")+
                   scale_y_continuous(breaks = seq(0, 20,2.5))+
                   labs(title="Real Time Chart K1:\nSN:00001,SN:00002,SN:00003", x="Time[s]", y="Temperature[°C]") 
                   
      g1
                    
    })
      
   
      
    output$TSarima<-renderPlot({  
      
    y <- tsseries()
    tss <- y[[1]]
    x <- seq(1:50)
    tss <- as.numeric(as.character(tss))
    tss <- auto.arima(tss)
    tsforecast <- forecast(tss)
    autoplot(tsforecast, ts.colour = 'blue')+ geom_hline(yintercept = 40,colour="red", linetype="dashed") +
    geom_text(aes(x = 25, y = 45 , label = "critical value"))+
    coord_cartesian(ylim = c(-5,50))+xlab("Time[d]")+ylab("Temperatur[°C]")+
    scale_y_continuous(breaks = seq(0, 20,4.0))+  
    labs(title="SN:00001\nForecast[d:10]")   
      
       
    })
    
    output$TSarima1<-renderPlot({  
      
      y <- tsseries2()
      tss <- y[[1]]
      x <- seq(1:50)
      tss <- as.numeric(as.character(tss))
      tss <- auto.arima(tss)
      tsforecast <- forecast(tss)
      tsforecast <- tsforecast
      autoplot(tsforecast, ts.colour = 'green')+ geom_hline(yintercept = 40,colour="red", linetype="dashed") +
      geom_text(aes(x = 25, y = 45 , label = "critical value"))+
      coord_cartesian(ylim = c(-5,50))+xlab("Time[d]")+ylab("Temperatur[°C]")+
      scale_y_continuous(breaks = seq(0, 20,4.0))+      
      labs(title="SN:00002\nForecast[d:10]")   
      
      
    })
    output$TSarima2<-renderPlot({  
      
      y <- tsseries3()
      tss <- y[[1]]
      x <- seq(1:50)
      tss <- as.numeric(as.character(tss))
      tss <- auto.arima(tss)
      tsforecast <- forecast(tss)
      autoplot(tsforecast) + geom_hline(yintercept = 40,colour="red", linetype="dashed") +
      geom_text(aes(x = 25, y = 45 , label = "critical value"))+
      coord_cartesian(ylim = c(-5,50))+xlab("Time[d]")+ylab("Temperatur[°C]")+
      scale_y_continuous(breaks = seq(0, 20,4.0))+  
      labs(title="SN:00003\nForecast[d:10]")   
      
      
    })
    
   
  observe({
      
      
      
      filepdf <- input$pdfId
      if (is.null(filepdf))
        return(NULL)
      
      
      if (input$goButton == 0)
        {return(NULL)}
        isolate({
          
          name=input$name
          bodys = input$body
           
      })
        
        sender <- "monitemapplication@gmail.com "  
        recipients <- c("abdulawelkamal@gmail.com")  
        email <- send.mail(from = sender,to = recipients,subject= paste0("", name),
                           body = paste0("Von Monitem:", bodys),
                           smtp = list(host.name = "aspmx.l.google.com", port = 25),
                           authenticate = FALSE,send = T,attach.files = filepdf$datapath)
                             
                           
        
        }) 
    
        
        
        
        
        
        
        
        
        
        
         
    
   

    
        
        
        
      
   
             
             
             
  
                  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
  
})