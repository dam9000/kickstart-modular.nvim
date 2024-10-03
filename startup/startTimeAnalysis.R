library(tidyverse)

log <- read.delim("startuptime.log", header = F) %>%
    unlist() %>%
    setNames(NULL)

nvim_start <- data.frame(name = log[5:19])
plugins_start <- data.frame(name = log[24:length(log)])

nvim_start <- lapply(nvim_start, gsub, pattern = "\\s+", replacement = " ") %>%
    as.data.frame()

plugins_start <- lapply(plugins_start, gsub, pattern = "\\s+", replacement = " ") %>%
    as.data.frame()

nvim_df <- nvim_start %>%
    separate(
        col = name,
        into = c("total_time", "self_time", "dscr"),
        sep = " ",
        extra = "merge"
    ) %>%
    {
        .[, "total_time"] <- as.numeric(.[, "total_time"])
        .
    } %>%
    {
        .[, "self_time"] %>%
            sapply(., sub, pattern = ":", replacement = "") %>%
            setNames(NULL) -> mod

        .[, "self_time"] <- mod
        .
    }

plugins_df <- plugins_start %>%
    separate(
        col = name,
        into = c("total_time", "self_time", "dscr"),
        sep = " ",
        extra = "merge"
    ) %>%
    {
        .[, "total_time"] <- as.numeric(.[, "total_time"])
        .
    } %>%
    {
        .[, "self_time"] %>%
            sapply(., sub, pattern = ":", replacement = "") %>%
            setNames(NULL) -> mod

        .[, "self_time"] <- mod
        .
    }

nvim_df %>%
    arrange(desc(self_time)) %>%
    write.table(., "nvimStartTime.txt", row.names = F, col.names = F)

plugins_df %>%
    arrange(desc(self_time)) %>%
    write.table(., "pluginsStartTime.txt", row.names = F, col.names = F)
