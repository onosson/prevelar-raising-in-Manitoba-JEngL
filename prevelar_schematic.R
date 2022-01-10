# This script is a modification of figure 1.1 from the Introduction to "The Low-Back-Merger Shift: Uniting the Canadian Vowel Shift, the California Vowel Shift, and Short Front Vowel Shifts across North America" (Kara Becker, 2019, Publication of the American Dialect Society 104(1), p. 1), which situates prevelar merger of BAG, BEG, VAGUE within the LBMS. I did not end up using this in the final version of my paper.

source("tidyverse")

############################################################
# LBMS-to-merger schematic

# colours
merger_col <- "deepskyblue4"
shift_col <- "darkolivegreen"
face_col <- "darkorange3"
velar_col <- "darkviolet"
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
  "KIT", 5, 11.75,
  "DRESS", 7, 8.5,
  "TRAP", 9, 4,
  
  "KIT", 36.75, 11.1,
  "DRESS", 41.5, 7.2,
  "TRAP", 44.75, 3
)

# coordinates for FACE
face <- tribble(
  ~word, ~x, ~y,
  "FACE", 4.6, 15,
  "FACE", 34, 15,
)

# coordinates for velar words
velar <- tribble(
  ~word, ~x, ~y,
  "VAGUE", 5, 13.5,
  "BEG", 5.4, 10,
  "BAG", 7.75, 6.25,
  
  "VAGUE", 41, 11,
  "BEG  BAG", 41, 9.6#,
  #"BAG", 39.2, 8.6
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
  5.9, 11.2, 7.5, 10,
  8, 7.75, 10.5, 6,
  10.4, 3.75, 14, 2.75
  
)

velar_merger_base <- ggplot(shift, aes(x = x, y = y)) +
  
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
  geom_point(aes(x = 13, y = 7), size = 8,
             colour = shift_col, shape = 21) +
  
  # shift arrows
  geom_segment(data = arrows[3:5,], colour = shift_col,
               aes(x = x1, y = y1, xend = x2, yend = y2),
               arrow = arrow(type="closed", length = unit(0.25, "cm"))) +
  
  # velar oval
  geom_ellipse(aes(x0 = 41, y0 = 10.2, a = 3.25, b = 1.75, angle = 0),
               size = 0.25, linetype = 2,
               colour = velar_col) +
  
  # velar circle
  geom_point(aes(x = 44, y = 13), size = 8,
             colour = velar_col, shape = 21) +
  
  theme_void()


velar_merger_serif_text <- velar_merger_base +
  
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
  geom_text(aes(x = 13, y = 7, label = "2"),
            fontface = "bold", family = "serif", 
            size = 5, colour = shift_col) +
  
  # velar text
  geom_text(data = velar, aes(label = word),
            fontface = "bold", family = "serif", 
            colour = velar_col) +
  
  # velar label
  geom_text(aes(x = 44, y = 13, label = "3"),
            fontface = "bold", family = "serif", 
            size = 5, colour = velar_col) +
  
  # FACE text
  geom_text(data = face, aes(label = word),
            fontface = "bold", family = "serif", 
            colour = face_col)
  
velar_merger_sans_text <- velar_merger_base +
  
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
  geom_text(aes(x = 13, y = 7, label = "2"),
            fontface = "bold", #family = "serif", 
            size = 5, colour = shift_col) +
  
  # velar text
  geom_text(data = velar, aes(label = word),
            fontface = "bold", #family = "serif", 
            colour = velar_col) +
  
  # velar label
  geom_text(aes(x = 44, y = 13, label = "3"),
            fontface = "bold", #family = "serif", 
            size = 5, colour = velar_col) +
  
  # FACE text
  geom_text(data = face, aes(label = word),
            fontface = "bold", #family = "serif", 
            colour = face_col)

expand <- 1.2

ggsave("Maps_misc/velar_merger_serif.pdf", 
       velar_merger_serif_text, width = 8*expand, height = 2.3*expand)

ggsave("Maps_misc/velar_merger_sans.pdf", 
       velar_merger_sans_text, width = 8*expand, height = 2.3*expand)
