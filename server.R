server <- function(input, output) {
  prob <- 0.99
  dcm_prob_input <- reactive({
    if (input$dcmWidget == "no masks") {
      prob = 0.99
    } else if (input$dcmWidget == "healthy masks") {
      prob = 0.8
    } else if (input$dcmWidget == "patient masks") {
      prob = 0.6
    } else if (input$dcmWidget == "all masks") {
      prob = 0.25
    } else if (input$dcmWidget == "masks and social distancing") {
      prob = 0.1
    } else {
      prob = 0.05
    }
  })
  
  icm_prob_input <- reactive({
    if (input$icmWidget == "no masks") {
      prob = 0.99
    } else if (input$icmWidget == "healthy masks") {
      prob = 0.8
    } else if (input$icmWidget == "patient masks") {
      prob = 0.6
    } else if (input$icmWidget == "all masks") {
      prob = 0.25
    } else if (input$icmWidget == "masks and social distancing") {
      prob = 0.1
    } else {
      prob = 0
    }
  })
  
  output$dcm <- renderPlot({
    param <- param.dcm(inf.prob = dcm_prob_input(), act.rate = 1, rec.rate = 1/25)
    init <- init.dcm(s.num = 1000, i.num = 1, r.num = 0)
    control <- control.dcm(type = "SIR", nsteps = input$dcm_time, dt = 1, nsims = 10)
    
    dcm <- plot(dcm(param, init, control))
    return(dcm)
  })
  
  output$icm <- renderPlot({
    param <- param.icm(inf.prob = icm_prob_input(), act.rate = 1, rec.rate = 1/25)
    init <- init.icm(s.num = 1000, i.num = 1, r.num = 0)
    control <- control.icm(type = "SIR", nsteps = input$icm_time, dt = 1, nsims = 10)
    icm <- plot(icm(param, init, control))
    return(icm)
  })

  
  
}
