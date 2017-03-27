library(tidyr)

df <- read.csv("GE2016MachinePublicCounter - General yr.csv", 
               stringsAsFactors = FALSE)
colnames(df) <- c("precinct",
                  "cartridge_total",
                  "poll_book",
                  "reconciliation")

df$cartridge_total <- as.numeric(df$cartridge_total)
df$poll_book <- as.numeric(df$poll_book)
df$difference <- df$cartridge_total - df$poll_book
df$absolute_dif <- abs(df$difference)

df$rec_voters <- df$reconciliation
df <- df %>% 
  separate(rec_voters, c("rec_voters", "rec_code"), "-")

df <- df[,c(1,2,3,5,8,4,6,7)]

write.csv(df, file="GE16_montgomery_pa_machine_public_counter.csv", row.names = F)
