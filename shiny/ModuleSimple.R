Box_Pret <- function()
{
  Blue_Box(
    title="Parametres du credit",
    width=12,
    fluidRow(
      column(width=3,numericInput(inputId = "numCRD", label = "Capital Restant du", value = 100000 ))
      # column(width=3,numericInput(inputId = "numTxPret", label = "Taux d interet", value=12 )),
      # column(width=3,numericInput(inputId = "numMensHass", label = "Mensualite Hors Assurance", value=1500 ))
    ),
    fluidRow(
      column(width=3,selectInput(
        inputId = "selFormat", 
        label = "Duree/Taux/Mensualite",
        choices=list("Taux d interet et Mensualite"=1, 
                     "Taux d interet et Duree"=2, 
                     "Mensualite et Duree"=3) )),
      
      conditionalPanel(
        condition = "input.selFormat == 3 || input.selFormat == 2",
        column(width=3,numericInput(inputId = "numDuree", label = "Duree", value = 240 ))),
      conditionalPanel(
        condition = "input.selFormat == 1 || input.selFormat == 2",
        column(width=3,numericInput(inputId = "numTxPret", label = "Taux d interet", value=12 ))),
      conditionalPanel(
        condition = "input.selFormat == 1 || input.selFormat == 3",
        column(width=3,numericInput(inputId = "numMensHass", label = "Mensualite Hors Assurance", value=1500 )))
    ),
    fluidRow(
      column(width=3,selectInput(
        inputId = "selDiffere", 
        label = "Differe",
        choices=list("Sans Differe"=1, 
                     "Differe au debut"=2, 
                     "Differe a la fin"=3) )),
      
      conditionalPanel(
        condition = "input.selDiffere != 1",
        column(width=3,numericInput(inputId = "numDureeDiff", label = "Duree Differe", value = 240 ))),
      conditionalPanel(
        condition = "input.selDiffere != 1",
        column(width=3,radioButtons(inputId = "rbTypeDiff", label = "Type Differe", choices = list("Total"=1,"Partiel"=2), inline = TRUE)))
    )
    
  )
}

Box_Assures <- function()
{
  Blue_Box(
    title="Parametres des Assures",
    width=12,
    fluidRow(
      column(width=3,selectInput(inputId = "selNombreAssu",label="Nombre d Assures", choices=c(1,2)))
    ),
    h4("Assure Un"),
    fluidRow(
      column(width=3,selectInput(inputId = "selSexe1",label="Civilite", choices=c("MR","MME","MLLE","Sans Importance"))),
      column(width=3,numericInput(inputId = "numAge1", label = "Age", value = 30 )),
      column(width=3,selectInput(inputId = "selSante1",label="Questionnaire Sante", choices=c("R.A.S","Fumeur","Q.S.A"))),
      column(width=3,numericInput(inputId = "selQuotite1",label="Quotite",value=100))
    ),
    conditionalPanel( condition="input.selNombreAssu == 2",
    h4("Assure Deux"),
    fluidRow(
      column(width=3,selectInput(inputId = "selSexe2",label="Civilite", choices=c("MR","MME","MLLE","Sans Importance"))),
      column(width=3,numericInput(inputId = "numAge2", label = "Age", value = 28 )),
      column(width=3,selectInput(inputId = "selSante2",label="Questionnaire Sante", choices=c("R.A.S","Fumeur","Q.S.A"))),
      column(width=3,numericInput(inputId = "selQuotite2",label="Quotite",value=100))
    )),
    div()
  )
}


Box_Garanties <- function()
{
  Blue_Box(
    title="Parametres des Garanties",
    width=12,
    fluidRow(
      column(width=3,selectInput(inputId = "selGaranties1",label="Garanties Assure Un", choices=c("DC"=1,"PTIA"=2,"AT"=3, "PE"=6, "IPT"=4, "IPP"=5),multiple = TRUE, selected=1:3)),
      column(width=3,selectInput(inputId = "selGaranties2",label="Garanties Assure Deux", choices=c("DC"=1,"PTIA"=2,"AT"=3, "PE"=6, "IPT"=4, "IPP"=5),multiple = TRUE, selected=1:2)),
      column(width=3, selectInput(inputId = "selAccidentels", choices = c("Incluses","Uniquement"),label = "Garanties Accidentels"))
      ),
    h4("DC"),
    fluidRow(
      column(width=3,selectInput(inputId = "selTableMortalite",label="Table de Mortalite", choices=c("Insee","BCAC"))),
      column(width=3,numericInput(inputId = "numAgeFinGarantieDC", label = "Age Fin Garantie DC", value = 90 )),
      column(width=3,numericInput(inputId = "numPrixPTIA",label="Prix PTIA / Prix DC",value=3))
    ),
    h4("AT"),
    fluidRow(
      column(width=3,selectInput(inputId = "selTableEntreeAT",label="Table Entree en AT", choices=c("Insee","BCAC"))),
      column(width=3,selectInput(inputId = "selTableMaintienAT",label="Table Maintien en AT", choices=c("Insee","BCAC"))),
      column(width=3,selectInput(inputId = "selFranchiseAT",label="Fanchise en AT (en mois)", choices=c(3,6,12, 1))),
      column(width=3,numericInput(inputId = "numAgeFinGarantieAT", label = "Age Fin Garantie AT", value = 75 ))),
    fluidRow(
      column(width=3,numericInput(inputId = "numPrixIPP",label="Prix IPP / Prix AT",value=0)),
      column(width=3,numericInput(inputId = "numPrixIPT",label="Prix IPT / Prix AT",value=0)),
      column(width=3,numericInput(inputId = "numPrixIPT",label="Prix IPT / Prix DC",value=0)),
      column(width=3,numericInput(inputId = "numAbattementPerteRevenu",label="Abattement Perte de Revenu",value=30))
    ),
    h4("PE"),
    fluidRow(
      column(width=3,selectInput(inputId = "selTablePE",label="Table Chomage", choices=c("Insee","BCAC"))),
      column(width=3,selectInput(inputId = "selFranchisePE",label="Fanchise en PE (en mois)", choices=c(3,6,12,18,24, 1 ))),
      column(width=3,numericInput(inputId = "numAgeFinGarantiePE", label = "Age Fin Garantie PE", value = 55 )),
      column(width=3,numericInput(inputId = "numDureeMaxPE", label = "Duree Maximum indemnisation", value = 12 ))
    )
  )
}


Box_Tarification <- function()
{
  Blue_Box(
    title="Parametres de Tarification",
    width=12,
    div()
  )
}

Box_Resultats <- function()
{
  Orange_Box(
    title="Resultats",
    width=12,
    DT::dataTableOutput(outputId = "dtEcheancier")
  )
}

UI_Simple <- function()
{
  fluidPage(
    title="Simple",
    Box_Pret(),
    Box_Assures(),
    Box_Garanties(),
    Box_Resultats()
   
  )
}

Server_Simple <- function(input, output, session) 
{
  output$dtEcheancier=
    DT::renderDataTable(
      DT::datatable(
        data = EcheancierPret(
          crd = input$numCRD,
          txpret = input$numTxPret,
          mensualite = input$numMensHass,
          duree = input$numDuree,
          format = input$selFormat, input$rbTypeDiff, input$numDureeDiff, input$selDiffere
          ), 
        selection ='none', 
        filter = "top", options = list(scrollX=TRUE, searching=FALSE, ordering=FALSE))
      %>% formatCurrency(columns = 1:4,  currency = "", digits=0, mark=" "),
      server=TRUE) 
  
  
}