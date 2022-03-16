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
          models: a deterministic model and a stochastic individual contact model. Users are able to view the 
          influence of wearing masks or social distancing."), style = "font-size: 20px; margin-left: auto; margin-right: auto;"),
  tags$h2("Policy Demonstration"),
  tags$img(class = "image",
           src = "demonstration.png",
           style = 'display: block; margin-left: auto; width: 50%; height: 20%; margin-right: auto;')
)

choices <- c("no masks",
             "healthy masks",
             "patient masks",
             "all masks",
             "masks and social distancing",
             "home quarantine")

dcm_choice <- selectInput(
  "dcmWidget",
  label = h2("Masks and Social Distancing Choices"),
  choices = choices,
  multiple = FALSE
)

icm_choice <- selectInput(
  "icmWidget",
  label = h2("Masks and Social Distancing Choices"),
  choices = choices,
  multiple = FALSE
)

time_slider <- sliderInput(
  "dcm_time",
  label = h2("Time"),
  min = 7,
  max = 200,
  step = 1,
  value = 7,
  dragRange = FALSE
)

icm_time <- sliderInput(
  "icm_time",
  label = h2("Time"),
  min = 7,
  max = 200,
  step = 1,
  value = 7,
  dragRange = FALSE
)

Deterministic_Model <- tabPanel(
  title = "Masks and Social Distancing Deterministic Model",
  sidebarLayout(
    sidebarPanel(
      dcm_choice,
      time_slider
    ),
    
    mainPanel(
      plotOutput("dcm")
    )
  )
)

Stochastic_Model <- tabPanel(
  title = "Masks and Social Distancing Stochastic Model",
  sidebarLayout(
    sidebarPanel(
      icm_choice,
      icm_time
    ),
    mainPanel(
      plotOutput("icm")
    )
  )
)

Interpretation <- tabPanel(
  title = "Interpretation",
  tags$h2("Interpretation"),
  hr(),
  p(paste("Two models provide users a series of behaviors of mask wearing and social distancing options 
          so that users are able to see the significant differences between no masks wearing policy and enforced 
          wearing masks."), style = "font-size: 20px; margin-left: auto; margin-right: auto;"),
  tags$h3("Deterministic Model of No Masks Wearing Policy"),
  tags$img(src = "dcm1.png"),
  tags$h3("Deterministic Model of Enforced Wearing Masks Policy"),
  tags$img(src = "dcm3.png"),
  p(paste("And after adding the social distancing parameter into the calculation, the significance increases."),style = "font-size: 20px; margin-left: auto; margin-right: auto;"),
  tags$h3("Deterministic Model of Wearing Masks and Social Distancing Policies"),
  tags$img(src = "dcm2.png"),
  p(paste("As we can see from the comparison, the time it needs for Covid-19 to infect most people is around 25 days,
          but after the wearing masks policy published, the number of time increased to 50 days. And accompanied with 
          social distancing policy, it needs 125 days to infect most people, and the total number of people who got infected 
          largely decreased. And in different scenarios, such as only patients wearing masks, or only people who hasn't got infected 
          wear a mask, the time that Covid needs to infect most people gradually increased, and the total number of people that got 
          infected all decreased. Thus, based on the observation, we are able to conclude that masks wearing policy is necessary in 
          order to prevent the spread of Covid. And the most effective policy is quarantine and social distancing."), style = "font-size: 20px; margin-left: auto; margin-right: auto;"),
  tags$h3("Deterministic Model of Home Quarantine"),
  tags$img(class = "image",
           src = "dcm4.png"),
  hr(),
  p(paste("By comparing the Deterministic Model and the Stochastic Model, we can observe a slight difference where the deterministic model 
          tend to have more rapid lines, compared to the stochastic model. Since these two models are similar to each other, we may conclude 
          that these policies, such as wearing masks, social distancing, and home quarantine, are effective. The similarity may due to the different calculation, that 
          stochastic model calculates individuals and the deterministic model calculate the whole population."), style = "font-size: 20px; margin-left: auto; margin-right: auto;"),
  hr(),
  p(paste("The limitation of this study is the inaccurate assumption values of each policies. Though it still gives us an idea of how 
          those policies behave to the Covid-19 spread."), style = "font-size: 20px; margin-left: auto; margin-right: auto;")
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
  