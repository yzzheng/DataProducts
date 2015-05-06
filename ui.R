# Blackjack simulator
# Mention that suits are not relevant
# Hit on soft 17

shinyUI(pageWithSidebar(
  headerPanel('Expected Dealer Score in Blackjack'),
  sidebarPanel(
    selectInput('card',"Dealer's face-up card",
                c('A','2','3','4','5','6','7','8','9','10','J','Q','K')),
    numericInput('trials','Number of Trials to run',10,min=10,max=10000),
    actionButton('goButton','Go!')
    ),
  mainPanel(
    h3('Simulation Results'),
    plotOutput('hist'),
    h3('Dealer Bust Rate: '),
    verbatimTextOutput('bust_rate'),
    h3('Mean dealer score on non-bust hands'),
    verbatimTextOutput('mean')
  )
))