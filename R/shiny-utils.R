
# Utils Shiny ----


#' Toggle Input UI
#'
#' @return a script tag.
#' @noRd
toggleInputUi <- function() {
  
  tags$script(
    "Shiny.addCustomMessageHandler('toggleInput',
   function(data) {
     $('#' + data.id).prop('disabled', !data.enable);
     if (data.picker) {
       $('#' + data.id).selectpicker('refresh');
     }
   }
);"
  )
  
}


#'  Toggle Input Server
#'
#' @param session shiny session.
#' @param inputId shiny input id.
#' @param enable enable enable or disable the input.
#' @param picker Is the input a \code{pickerInput}.
#'
#' @noRd
toggleInputServer <- function(session, inputId, enable = TRUE, picker = FALSE) {
  session$sendCustomMessage(
    type = 'toggleInput',
    message = list(id = inputId, enable = enable, picker = picker)
  )
}


