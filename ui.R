Introduction <- tabPanel(
  tags$span(class = "header", "Introduction"),
  tags$img(class = "image", 
          src = "https://www.brookecountyhealthdepartment.com/wp-content/uploads/CoronaVirusHeader-Final-3.jpg",
          style = 'display: block; margin-left: auto; width: 50%; height: 20%; margin-right: auto;'),
  hr(),
  tags$h2("Overview"),
  br(),
  p(paste("In 2019, a new type of contangious disease was identified in China, and before Chinese government reacted, it rapidly spreaded through out
           China and caused a global pandemic. Responding to this newly discovered disease, China government has published a series of policies, in order 
          to control the "), style = "font-size: 20px; margin-left: auto; margin-right: auto;"),
  br(),
  p(paste("This project is aiming to find the impact that different policies has brought to the spread of COVID-19, for instance, 
          mask wearing in public, social distancing, vaccination requirement, etc. In order to analyze such influence, this project used two
          models: a deterministic model and a stochastic individual contact model. Users are able to select different policy changes to view the 
          result."), style = "font-size: 20px; margin-left: auto; margin-right: auto;")
)

Deterministic_Model <- tabPanel(
  "Deterministic Model"
)

Stochastic_Model <- tabPanel(
  "Stochastic Model"
)

Interpretation <- tabPanel(
  "Interpretation"
)






ui <- fluidPage(

  
  navbarPage(
    "a3-disease-modeling",
    Introduction,
    Deterministic_Model,
    Stochastic_Model,
    Interpretation
  )
)
  