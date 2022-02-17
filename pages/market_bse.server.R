
# data --------------------------------------------------------------------


# table -------------------------------------------------------------------

output$market_bse_tbl_stock = renderReactable(
  reactable(iris)
)


# valuebox ----------------------------------------------------------------

output$market_bse_valuebox_mkt = renderValueBox(
  
  data = mkt_data %>% 
    mutate(
      year = year(DATETIME),
      
    ) %>%
    group_by(year) %>% 
    summarise(
      value = 
    )
  
  valueBoxSpark(
    value = tagList(countup(2200, duration = countup_time, start = T), " 亿元"),
    title = toupper("北交所市场市值"),
    sparkobj = NULL,
    subtitle = "",
    info = "2021年中国重点城市新接订单情况",
    icon = icon("file-signature"),
    width = 4,
    color = "teal",
    href = NULL
  )
)

output$market_bse_valuebox_volume = renderValueBox(
  valueBoxSpark(
    value = tagList(countup(1109, duration = countup_time, start = T), " 亿元"),
    title = toupper("北交所开市以来成交总额"),
    sparkobj = NULL,
    subtitle = "",
    info = "2021年中国重点城市手持订单情况",
    icon = icon("file-signature"),
    width = 4,
    color = "red",
    href = NULL
  )
)

output$market_bse_valuebox_change = renderValueBox(
  valueBoxSpark(
    value = tagList(countup(2, duration = countup_time, start = T), " %"),
    title = toupper("北交所全市场换手率"),
    sparkobj = NULL,
    subtitle = "",
    info = "2021年中国重点城市订单交付情况",
    icon = icon("file-signature"),
    width = 4,
    color = "yellow",
    href = NULL
  )
)
