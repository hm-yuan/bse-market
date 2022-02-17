
# packages ----------------------------------------------------------------

library(shiny)
library(bs4Dash)
library(shinyWidgets)
library(fontawesome)

# pre loading -------------------------------------------------------------


# settings ----------------------------------------------------------------

# 路径设置
PAGE_PATH = "pages/"

# countup time
countup_time = 5

# data --------------------------------------------------------------------

mkt_data = readRDS("data/data_trade_c.rds")
