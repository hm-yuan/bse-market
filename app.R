
# environment -------------------------------------------------------------

rm(list = ls())

source("global.R", local = T, encoding = "utf-8")


# UI ----------------------------------------------------------------------
# 1.-- header
# 2.-- sidebar
# 3.-- controlbar

ui_header = dashboardHeader(
  title = NULL,
  titleWidth = NULL,
  disable = FALSE,
  .list = NULL,
  skin = "light",
  status = "white",
  border = TRUE,
  compact = TRUE,
  sidebarIcon = shiny::icon("bars"),
  controlbarIcon = shiny::icon("th"),
  fixed = TRUE,
  leftUi = NULL,
  rightUi = NULL
)

ui_sidebar = dashboardSidebar(
  disable = FALSE,
  width = 100,
  skin = "light",
  flat = TRUE,
  status = "lightblue",
  elevation = 5,
  collapsed = TRUE,
  minified = TRUE,
  expandOnHover = TRUE,
  fixed = TRUE,
  id = "bse_sidebar",
  customArea = NULL,
  sidebarUserPanel(
    image = "logo.png", 
    name = "上市公司管理部"
  ),
  sidebarMenu(
    id = "bse_sidebar_menu",
    sidebarHeader(""),
    menuItem(icon = icon("chart-bar"), tabName = "market-bse", "北交所市场"),
    menuItem(icon = icon("file-medical-alt"), tabName = "market-xxx", "跨市场对比")
  )
)

ui = dashboardPage(
  title = "北京证券交易所",
  header = dashboardHeader(fixed = TRUE, title = "", titleWidth = 350, border = FALSE),
  sidebar = ui_sidebar,
  controlbar = dashboardControlbar(),
  footer = dashboardFooter(),
  body = dashboardBody(
    tabItems(
      # 市场数据
      tabItem(tabName = "market-bse", source(paste0(PAGE_PATH, "market_bse.ui.R"), local = T, encoding = "UTF-8")$value),
      tabItem(tabName = "market-xxx", source(paste0(PAGE_PATH, "market_xxx.ui.R"), local = T, encoding = "UTF-8")$value)
    )
  )
)

# SERVER ------------------------------------------------------------------

server = function(input, output, session) {
  
  # market
  source(paste0(PAGE_PATH, "market_bse.server.R"), local = T, encoding = "UTF-8")
  source(paste0(PAGE_PATH, "market_xxx.server.R"), local = T, encoding = "UTF-8")
}


# shinyapp ----------------------------------------------------------------

shinyApp(ui, server)