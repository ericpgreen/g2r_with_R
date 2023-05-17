vsla %>%
  ggplot(aes(x = p_t, y = fct_reorder(subcounty, p_t), 
             fill = category,
             label = actual_t)) +
  geom_col() +
  scale_x_continuous(labels = scales::percent_format()) +
  scale_fill_manual(values=c("#006db0", "#008a2e")) +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title.position = "plot",
        plot.title = element_text(face="bold"),
        plot.caption = element_text(size=7)) +
  labs(x = NULL, y = NULL,
       title = "6 in 10 target households participated in VSLA trainings",
       subtitle = "2023 Q1",
       caption = str_wrap("Percentage represents the actual/target households participating in VSLA trainings. The number at the end of each bar indicates the count of the actual households participating.", 120)) +
  geom_vline(xintercept = vsla_o$p) +
  geom_text(hjust = 1, size=3, color="white") +
  annotate("text", x = vsla_o$p, y=2, 
           label = paste0("Overall ", round(vsla_o$p*100, 0), "%"),
           hjust = 0)