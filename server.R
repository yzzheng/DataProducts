library(ggplot2)

score_hand <- function(hand){
  score = 0
  aces = 0
  for (j in 1:length(hand)){
    if (hand[j] == 'K' || hand[j] == 'Q' || hand[j] == 'J'){
      score <- score + 10
    }
    else if (hand[j] == 'A'){
      aces <- aces + 1
      score <- score + 11
    }
    else{
      score <- score + as.numeric(hand[j])
    }
    if (score > 21 && aces > 0){
      score <- score - 10
    }
  } 
  score
}
simulate <- function(card, trials){
   scores <- vector(mode="numeric")
   for (i in 1:trials){
     deck <- c(rep('A',24),rep('1',24),rep('2',24),rep('3',24),rep('4',24),rep('5',24),rep('6',24), 
               rep('7',24),rep('8',24),rep('9',24),rep('10',24),rep('J',24),rep('Q',24),rep('K',24))
    deck <- deck[-match(card,deck)]
    hole_card <- sample(deck,1)
    deck <- deck[-match(hole_card,deck)]
    dealer_hand <- c(card,hole_card)
    dealer_score <- score_hand(dealer_hand)
    while (dealer_score < 17){
      new_card <- sample(deck,1)
      deck <- deck[-match(new_card,deck)]
      dealer_hand <- c(dealer_hand,new_card)
      dealer_score <- score_hand(dealer_hand)
    }
    if (dealer_score > 21){
      dealer_score <- 22
    }
    scores <- c(scores,dealer_score)
  }
  scores
}

shinyServer(
  function(input,output){ 
    scores <- reactive({simulate(input$card,input$trials)})
    output$hist <- renderPlot({qplot(scores(), xlab = 'Dealer Score',         
                    ylab = 'Score Proportion',ggtitle = 'Distribution of Simulated Dealer Scores', 
                    binwidth = .2) + scale_x_continuous(breaks=17:22,labels = c('17','18','19','20','21','BUST'))}) 
    output$bust_rate <- renderPrint({sum(scores() == 22)/length(scores())})
    output$mean <- renderPrint({mean(scores()[scores() != 22])})
  }
)