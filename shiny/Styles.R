Blue_Box <- function(title, width = 12, ...)
{
  box( ...,
       title = title, status = "primary", solidHeader = TRUE,
       collapsible = TRUE, width = width, collapsed = TRUE
  )
}

Green_Box <- function(title, width = 12, ...)
{
  box(...,
      title = title, status = "success", solidHeader = TRUE,
      collapsible = TRUE, width = width, collapsed = TRUE 
  )
}

Orange_Box <- function(title, width = 12, ...)
{
  box(...,
      title =title, status = "warning", solidHeader = TRUE,
      collapsible = TRUE, width = width, collapsed = TRUE 
  )
}

Value_Box <- function(value, title,decimaldigits = 0  )
{
  valueBox(
    value = prettyNum( value ,big.mark = " ", digits=decimaldigits, scientific=FALSE ),
    subtitle = title, 
    icon = icon("smile-o"),
    color = "purple")
}