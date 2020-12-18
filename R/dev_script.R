# Installing packages
#devtools::install_github('lbraglia/telegram')

#Uploading required packages
pacman::p_load("tidyverse","telegram","usethis","anytime")

#Saving the token in my Renviron with usethis package
#usethis::edit_r_environ()

#Bot test
## Create the bot object
bot <- TGBot$new(token = bot_token('allmedicalexpertsbot'))

## Now check bot connection it should print some of your bot's data
bot$getMe()

## Here, check what you have inserted
bot$getUpdates() -> bot_overall

### default chat_id bot for the following commands (to ease typing)
bot$set_default_chat_id(1268903682)

##sending messages
bot$sendMessage("Bem vindo", chat_id="1154105296")

##selecting date and time
anytime::anydate(bot_overall$message$date)
anytime(bot_overall$message$date) %>%
   tibble(data = .) %>%
  mutate_at(.vars = vars("data"), .funs = list(hora = lubridate::hour,
                               minutos = lubridate::minute,
                               segundos = lubridate::second))




