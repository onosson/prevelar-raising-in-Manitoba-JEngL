# This script replicates figure 1.1 from the Introduction to "The Low-Back-Merger Shift: Uniting the Canadian Vowel Shift, the California Vowel Shift, and Short Front Vowel Shifts across North America" (Kara Becker, 2019, Publication of the American Dialect Society 104(1), p. 1). I did not end up using this in the final version of my paper.

library(tidyverse)

############################################################
# LBMS schematic

# colours
merger_col <- "deepskyblue4"
shift_col <- "darkolivegreen"
shape_col <- "gray"
shape_alpha <- 0.05

# coordinates for merger words
merger <- tribble(
  ~word, ~x, ~y,
  "LOT", 17, 4,
  "THOUGHT", 20, 6,
  
  "LOT", 46.4, 4.75,
  "THOUGHT", 46.4, 6
)

# coordinates for shift words
shift <- tribble(
  ~word, ~x, ~y,
  "KIT", 5, 13,
  "DRESS", 7, 8.5,
  "TRAP", 9, 4,
  
  "KIT", 36.75, 11.1,
  "DRESS", 41.5, 7.2,
  "TRAP", 44.75, 3
)

# trapezoid corners
trapezoid <- tribble(
  ~x, ~y,
  0, 17,
  26, 17,
  23, 0,
  6, 0
)

# triangle corners
triangle<- tribble(
  ~x, ~y,
  29, 17,
  58, 17,
  45, 0
)

# all arrow coordinates
arrows <- tribble(
  ~x1, ~y1, ~x2, ~y2,
  
  # shape arrow
  26, 8, 35, 8,
  
  # merger arrow
  18.5, 4, 20.25, 5,
  
  # shift arrows
  5.75, 12.25, 7.5, 10,
  8, 7.75, 10.5, 6,
  10.4, 3.75, 14, 2.75
  
)

lbms_base <- ggplot(shift, aes(x = x, y = y)) +
  
  # trapezoid
  geom_polygon(data = trapezoid,
               alpha = shape_alpha, colour = shape_col, size = 1) +
  
  # triangle
  geom_polygon(data = triangle,
               alpha = shape_alpha, colour = shape_col, size = 1) +
  
  # shape arrow
  geom_segment(data = arrows[1,], colour = "black", size = 1,
               aes(x = x1, y = y1, xend = x2, yend = y2),
               arrow = arrow(type="closed", length = unit(0.35, "cm"))) +
  
  # merger circle
  geom_point(aes(x = 21, y = 3.5), size = 8,
             colour = merger_col, shape = 21) +
  
  # merger arrow
  geom_segment(data = arrows[2,], colour = merger_col,
               aes(x = x1, y = y1, xend = x2, yend = y2),
               arrow = arrow(type="closed", length = unit(0.25, "cm"))) +
  
  # merger oval
  geom_ellipse(aes(x0 = 46.4, y0 = 5.5, a = 3.65, b = 1.75, angle = 0),
               size = 0.25,
               colour = merger_col) +
  
  # shift circle
  geom_point(aes(x = 11, y = 9), size = 8,
             colour = shift_col, shape = 21) +
  
  # shift arrows
  geom_segment(data = arrows[3:5,], colour = shift_col,
               aes(x = x1, y = y1, xend = x2, yend = y2),
               arrow = arrow(type="closed", length = unit(0.25, "cm"))) +
  
  theme_void()

lbms_serif_text <- lbms_base +
  
  # merger text
  geom_text(data = merger, aes(label = word),
            fontface = "bold", family = "serif", 
            colour = merger_col) +
  
  # merger label
  geom_text(aes(x = 21, y = 3.5, label = "1"),
            fontface = "bold", family = "serif", 
            size = 5, colour = merger_col) +
  
  # shift text
  geom_text(data = shift, aes(label = word),
            fontface = "bold", family = "serif", 
            colour = shift_col) +
  
  # shift label
  geom_text(aes(x = 11, y = 9, label = "2"),
            fontface = "bold", family = "serif", 
            size = 5, colour = shift_col)

lbms_sans_text <- lbms_base +
  
  # merger text
  geom_text(data = merger, aes(label = word),
            fontface = "bold", #family = "serif", 
            colour = merger_col) +
  
  # merger label
  geom_text(aes(x = 21, y = 3.5, label = "1"),
            fontface = "bold", #family = "serif", 
            size = 5, colour = merger_col) +
  
  # shift text
  geom_text(data = shift, aes(label = word),
            fontface = "bold", #family = "serif", 
            colour = shift_col) +
  
  # shift label
  geom_text(aes(x = 11, y = 9, label = "2"),
            fontface = "bold", #family = "serif", 
            size = 5, colour = shift_col)
  
lbms_serif_text
lbms_sans_text

expand <- 1.2

ggsave("Maps_misc/lbms_schematic_serif.pdf", lbms_serif_text, 
       width = 8*1.2, height = 2.3*1.2)

ggsave("Maps_misc/lbms_schematic_sans.pdf", lbms_sans_text, 
       width = 8*1.2, height = 2.3*1.2)

#####################################################
rm(list=ls()[! ls() %in% never_delete])
