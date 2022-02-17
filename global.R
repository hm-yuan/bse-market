
# packages ----------------------------------------------------------------

library(shiny)
library(bs4Dash)
library(tidyverse)
library(shinyWidgets)
library(fontawesome)
library(lubridate)
library(reactable)
library(countup)
library(echarts4r)
library(highcharter)

# pre loading -------------------------------------------------------------


# settings ----------------------------------------------------------------

# 路径设置
PAGE_PATH = "pages/"

# countup time
countup_time = 5

# data --------------------------------------------------------------------

mkt_data = readRDS("data/data_trade_c.rds")


# widget ------------------------------------------------------------------

# value box --------------------------------------------------------------------
main_valuebox = function(value, icon = "anchor", width = 4, title, color = "info"){
  valueBox(
    width = width,
    value = value,
    elevation = 4,
    subtitle = title,
    icon = icon(icon),
    gradient = TRUE,
    color = color
  )
}

valueBoxSpark <- function(
  value, title, sparkobj = NULL, subtitle, info = NULL, 
  icon = NULL, color = "aqua", width = 4, href = NULL
){
  
  shinydashboard:::validateColor(color)
  
  if (!is.null(icon))
    shinydashboard:::tagAssert(icon, type = "i")
  
  info_icon <- tags$small(
    tags$i(
      class = "fa fa-info-circle fa-lg",
      title = info,
      `data-toggle` = "tooltip",
      style = "color: rgba(255, 255, 255, 0.75);"
    ),
    # bs3 pull-right 
    # bs4 float-right
    class = "pull-right float-right"
  )
  
  boxContent <- div(
    class = paste0("small-box bg-", color),
    div(
      class = "inner",
      tags$small(title),
      if (!is.null(sparkobj)) info_icon,
      h3(value),
      if (!is.null(sparkobj)) sparkobj,
      p(subtitle)
    ),
    # bs3 icon-large
    # bs4 icon
    if (!is.null(icon)) div(class = "icon-large icon", icon, style = "z-index; 0")
  )
  
  if (!is.null(href)) 
    boxContent <- a(href = href, boxContent)
  
  div(
    class = if (!is.null(width)) paste0("col-sm-", width), 
    boxContent
  )
}

radio_button = function(id, color = "warning", label = NULL, choices, selected, inline = T, ...){
  prettyRadioButtons(
    inputId = id, 
    label = label,
    choices = choices,
    selected = selected,
    status = color,
    icon = icon("check"), 
    bigger = T,
    inline = inline,
    animation = "jelly", plain = T, thick = T, ...
  )
}