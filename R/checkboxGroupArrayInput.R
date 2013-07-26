checkboxGroupArrayInput <- function(inputId, label, choices, selected = NULL, ncol = 3)
{
  choices <- shiny:::choicesWithNames(choices)
  checkboxes <- list(HTML("<table>"))
  thiscol <- 1
  for (i in seq_along(choices)) {
    checkboxes[[length(checkboxes)+1]] <- HTML(ifelse(thiscol==1, "<tr><td>", "<td>"))
    choiceName <- names(choices)[i]
    inputTag <- tags$input(type = "checkbox", name = inputId,
                           id = paste(inputId, i, sep = ""), value = choices[[i]])
    if (choiceName %in% selected) inputTag$attribs$checked <- "checked"
    checkbox <- tags$label(class = "checkbox", inputTag, tags$span(choiceName))
    checkboxes[[length(checkboxes)+1]] <- checkbox
    checkboxes[[length(checkboxes)+1]] <- HTML(ifelse(thiscol==ncol, "</td></tr>", "</td>"))
    thiscol <- ifelse(thiscol==ncol, 1, thiscol+1)
  }
  if (thiscol>1) {
    checkboxes[[length(checkboxes)+1]] <- HTML(rep("<td>&nbsp;</td>", ncol - thiscol + 1))
    checkboxes[[length(checkboxes)+1]] <- HTML("</tr>")
  }
  checkboxes[[length(checkboxes)+1]] <- HTML("</table>")
  tags$div(id = inputId, class = "control-group shiny-input-checkboxgroup",
           shiny:::controlLabel(inputId, label), checkboxes)
}

