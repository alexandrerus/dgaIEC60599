source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly")
####################################################

################### Actual code ####################
p <- Values %>%
  plot_ly(x = ~x_cube, y = ~y_cube, z = ~z_cube, color = ~factor(codigoEquipamento)) %>%
  add_markers(showscale = FALSE, showlegend = FALSE, marker_showscale = FALSE, showframe = FALSE, hoverinfo = 'text', text = ~paste('Cod. do Equipamento: ', codigoEquipamento,
 	 									   '<br>Amostra: ', Amostra, '<br>C2H4/C2H6: ', x_cube, '<br>CH4/H2: ', y_cube, '<br>C2H2/C2H4: ', z_cube)) %>%

  layout(showlegend = FALSE, scene = list(xaxis = list(range = c(0, 10), title = 'C2H4/C2H6 (x)', gridcolor="rgb(0,0,0)"),
                      yaxis = list(range = c(0, 10), title = 'CH4/H2 (y)', gridcolor="rgb(0,0,0)"),
                      zaxis = list(range = c(0, 10), title = 'C2H2/C2H4 (z)', gridcolor="rgb(0,0,0)"))) %>%

  config(displayModeBar = FALSE);
  
internalSaveWidget(p, 'out.html');
####################################################