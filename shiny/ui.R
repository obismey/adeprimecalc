#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(DT)
# Define UI for application that draws a histogram
shinyUI(
  dashboardPage( skin="green",
    dashboardHeader(disable = TRUE),
    dashboardSidebar(disable = TRUE),
    dashboardBody(
      tabItems(
        tabItem(tabName = "Simple"),
        tabItem(tabName = "Complexe"),
        tabItem(tabName = "Options")
      )
    )
  )
)
