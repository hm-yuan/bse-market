fluidPage(
  fluidRow(
    shinydashboard::valueBoxOutput("market_bse_valuebox_mkt"),
    shinydashboard::valueBoxOutput("market_bse_valuebox_volume"),
    shinydashboard::valueBoxOutput("market_bse_valuebox_turnover")
  ),
  fluidRow(
    column(width = 1),
    column(
      width = 2,
      radio_button(
        id = "market_bse_widgets_period", 
        choices = c("年" = "date_by_year", "月" = "date_by_month", "日" = "date_by_day"),
        selected = "date_by_year", color = "danger", label = ""
      )
    ),
    column(
      width = 3,
      radio_button(
        id = "market_bse_widgets_caliber", 
        choices = c("全周期" = "whole_bse", "开市前" = "before_bse", "开市后" = "after_bse"),
        selected = "whole_bse", color = "danger", label = ""
      )
    ),
    column(
      width = 3,
      pickerInput(
        inputId = "market_bse_widgets_firm",
        label = "", 
        choices = attr(unlist(firm_info$名称), "Labels"),
        multiple = T,
        options = list(
          `live-search` = TRUE)
      )
    )
  ),
  fluidRow(
    column(
      width = 8,
      bs4Card(
        width = 12, title = tagList(icon("file-signature"), " 新接订单情况"), collapsible = T, closable = F, maximizable = T,
        fluidRow(
          echarts4rOutput("market_bse_plt_mkt_outlook")
        ),
        br(),
        fluidRow(
          column(width = 4, echarts4rOutput("market_bse_plt_p1")),
          column(width = 4, echarts4rOutput("market_bse_plt_p2")),
          column(width = 4, echarts4rOutput("market_bse_plt_p3"))
        )
      )
    ),
    column(
      width = 4,
      bs4Card(
        title = "具体数据", width = 12,
        reactableOutput("market_bse_tbl_stock")
      )
    )
  )
)