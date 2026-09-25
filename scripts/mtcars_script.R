library(plotly)
library(htmltools)

data(mtcars)
mtcars$car <- rownames(mtcars)

fig <- plot_ly(
  data = mtcars,
  x = ~hp,
  y = ~mpg,
  type = "scatter",
  mode = "markers",
  text = ~car,
  hovertemplate = paste(
    "<b>%{text}</b><br>",
    "Puissance : %{x}<br>",
    "MPG : %{y}<br>",
    "Poids : %{marker.size}"
  ),
  marker = list(
    size = ~ wt * 8,
    color = ~cyl,
    colorscale = "Viridis",
    showscale = TRUE,
    colorbar = list(title = "Cylindres")
  )
) %>%
  layout(
    title = "Voitures : puissance vs consommation",
    xaxis = list(title = "Puissance (chevaux)"),
    yaxis = list(title = "Miles par gallon (MPG)")
  )

save_html(
  fig,
  file = "output/mtcars_plot.html"
)
