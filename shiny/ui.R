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

source("Core.R")
source("Styles.R")
source("ModuleOptions.R")
source("ModuleSimple.R")

shinyUI(
  dashboardPage( skin="green",
    dashboardHeader(disable = TRUE),
    dashboardSidebar(collapsed = TRUE,
      disable = FALSE,sidebarMenu(
        id = "mainMenu",
        menuItem("Simple", tabName = "Simple", icon = icon("dashboard")),
        menuItem("Complexe",  tabName = "Complexe", icon = icon("user-md")),
        menuItem("Options", tabName = "Options", icon = icon("user-md")))
      ),
    dashboardBody(
      tabItems(
        tabItem(tabName = "Simple", UI_Simple()),
        tabItem(tabName = "Complexe"),
        tabItem(tabName = "Options", UI_Options())
      )
    )
  )
)
