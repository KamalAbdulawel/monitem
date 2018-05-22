

library(shinydashboard)
library(shiny)
library(leaflet)
library(plotly)
library(ggplot2)
library(dplyr)
library(shinyAce)

#-----------------------Dashboard Page------------------------------------------------

shinydashboard::dashboardPage(
shinydashboard::dashboardHeader(title = "MONITEM",titleWidth = 125),
shinydashboard::dashboardSidebar(width = 125, # Sidebar menu
shinydashboard::sidebarMenu( 
shinydashboard::menuItem("Home",tabName = "home",icon = shiny::icon("home")),  
shinydashboard::menuItem("Standort",icon = shiny::icon("th"),tabName = "standort",        
shinydashboard::menuItem("Frankfurt",tabName = "frankfurt",                            
shinydashboard::menuItem("K1",tabName = "ka1") ,
shinydashboard::menuItem("K1table",tabName = "ka1table" )


)))), 

#----------------------Dashboard Body-----------------------------------------------------
# shinydashboard::dashboardBody(
shinydashboard::tabItems(
shinydashboard::tabItem(tabName = "home",
      
fluidRow(
absolutePanel(column(6,leafletOutput("mymap", height = 390, width = 1100)),
top = "55px", left = "122px", right ="120px",
width = "auto", height = "auto", draggable = FALSE, fixed = FALSE, cursor ="auto")),
fluidRow(
absolutePanel(column(2, selectInput('in1', 'Stores',  c("All","Aldi","Norma","Edeka","Penny"), selectize=T)),
              column(2, selectInput('in2','Location', c("All","Bockenheim","Sachsenhausen ","Riederwald","Fechenheim",
                                                        "Oberrad","Stadtzentrum"), multiple = F,selectize=T)),
              column(2, selectInput('in3','Event',    c("All","Wartung","Warnung","Signal Missing","All Fine"),selectize=T)),
                        top = "450px",left = "122px", width = "1100px", height = "50px"),
absolutePanel(column(2, actionButton("gook", "Count All Events")), 
			                  top = "475px",left = "700px", width = "125px", height = "50px")),
			
fluidRow(
absolutePanel(verbatimTextOutput("event2"),
			       top = "475px",left = "900px",width = "300px", height = "50px"))),

shinydashboard::tabItem(tabName = "ka1",
                  
                shiny::tabPanel( "K1",shiny::fluidRow(
                  
                absolutePanel(h3("Kuehlanlage:Miele"),
                              top = "70px", left = "140px"),
                absolutePanel(h3("Store:Aldi"),
                             top = "95px", left = "140px"),
                absolutePanel(h3("Location:Bockenheim"),
                             top = "120px", left = "140px"),
                  
                absolutePanel(plotOutput("TS",height = "380px", width = "550px" ),
                              top = "175px", left = "130px"),
                absolutePanel(plotOutput("TSarima",height = "175px", width = "425px"),
                              top = "80px", left = "800px"),
                absolutePanel(plotOutput("TSarima1",height = "175px", width = "425px"),
                              top = "265px", left = "800px")),
                absolutePanel(plotOutput("TSarima2",height = "175px", width = "425px"),
                              top = "450px", left = "800px"))),
               
shinydashboard::tabItem(tabName = "ka1table",
                
                absolutePanel(DT::dataTableOutput('tbl',height = "800px", width = "650px"),
                                      top = "55px", left = "150px"),
                
                absolutePanel(textAreaInput("name", "Betreff eingeben:", ""),
                              top = "80px",left = "850px", width = "175px", height = "75px"),
                absolutePanel(textAreaInput("body", "Nachricht eingben:", ""),
                              top = "180px",left = "850px", width = "175px", height = "75px"),
                absolutePanel(actionButton("goButton",label = "Send Mail", icon = icon("envelope-o")),
                              top = "420px",left = "850px", width = "175px", height = "75px")	,
                
               absolutePanel( fileInput("pdfId","Dokument waehlen", multiple = T, accept = c("pdf"), width = NULL,
                          buttonLabel = "Browse...", placeholder = "Bitte Dokument waehlen"),
                          top = "330px",left = "850px", width = "175px", height = "75px")
                          
                          
                          
                          
                          )
                
                
                )
                
                
                
                
               

                
                
                
                
                 
                
                
                
                
                
  )










