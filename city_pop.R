# This script generates a bar chart of cross-provincial populations including the two largest cities in each province, from B.C. to Quebec. I did not end up using this in the final version of my paper.

# common preliminaries including data and packages
source("_prelims.R")

############################################################
# city comparison
AB <- 4067175
BC <- 4648055
MB <- 1278365
ON <- 13448494
PQ <- 8164361
SK <- 1098352

CMA <- tribble(
  ~City, ~city_pop, ~Province, ~prov_pop,
  
  "Vancouver", 2463431, "B.C.", BC,
  "Victoria", 367770, "B.C.", BC,
  "Other", BC-2463431-367770, "B.C.", BC,
  
  "Calgary", 1389609, "ALBERTA", AB,
  "Edmonton", 1321426, "ALBERTA", AB,
  "Other", AB-1389609-1321426, "ALBERTA", AB,
  
  "Saskatoon", 295095, "SASK.", SK,
  "Regina", 236481, "SASK.", SK,
  "Other", SK-295095-236481, "SASK.", SK,
  
  "Winnipeg", 778489, "MANITOBA", MB,
  "Brandon", 58003, "MANITOBA", MB,
  "Other", MB-778489-58003, "MANITOBA", MB,
  
  "Toronto", 5928040, "ONTARIO", ON,
  "Ottawa", 1323783, "ONTARIO", ON,
  "Other", ON-5928040-1323783, "ONTARIO", ON,
  #"Hamilton", 747545, "ONTARIO", ON,
  #"Kitchener", 523894, "ONTARIO", ON,
  #"London", 494069, "ONTARIO", ON,
  #"St Cath.", 406074, "ONTARIO", ON,
  #"Oshawa", 379848, "ONTARIO", ON,
  #"Windsor", 329144, "ONTARIO", ON,
  #"_Other", ON-5928040-1323783-747545-523894-494069-406074-379848-329144, "ONTARIO", ON,
  
  "Montréal", 4098927, "QUEBEC", PQ,
  "Québec", 800296, "QUEBEC", PQ,
  "Other", PQ-4098927-800296, "QUEBEC", PQ
  
)

CMA$Province <- factor(CMA$Province, levels = c("B.C.", "ALBERTA", "SASK.", "MANITOBA", "ONTARIO", "QUEBEC"))

CMA$City <- fct_reorder(CMA$City, -CMA$city_pop)
CMA$City <- fct_relevel(CMA$City, "Other")

cities_plot_base <- ggplot(CMA, 
                      aes(fill = City, label = City, 
                          x = Province, y = city_pop/prov_pop)) +
  geom_bar(position = "fill", stat = "identity") +
  scale_fill_viridis_d(end = 0.85) +
  theme_void() +
  guides(fill = FALSE)

cities_plot_serif <- cities_plot_base +
  geom_text(data = CMA %>% filter(City != "Other"),
            colour = "white", 
            #fontface = "bold", 
            family = "serif",
            position = position_stack(vjust=0.5)) +
  geom_text(data = CMA %>% filter(City == "Other"), 
            aes(label = Province, y = 0.95), 
            colour = "white", 
            fontface = "bold", 
            family = "serif"
  ) +
  geom_text(data = CMA %>% filter(City == "Other"), 
            aes(label = comma(prov_pop), y = 0.88), 
            colour = "white", 
            family = "serif"
  )

cities_plot_sans <- cities_plot_base +
  geom_text(data = CMA %>% filter(City != "Other"),
            colour = "white", 
            fontface = "bold", 
            #family = "serif",
            position = position_stack(vjust=0.5)) +
  geom_text(data = CMA %>% filter(City == "Other"), 
            aes(label = Province, y = 0.95), 
            colour = "white", 
            fontface = "bold"
            #,family = "serif"
  ) +
  geom_text(data = CMA %>% filter(City == "Other"), 
            aes(label = comma(prov_pop), y = 0.88), 
            colour = "white"
            #,family = "serif"
  )

plot_height = 3.5

ggsave("Plots/cities_plot_serif.pdf", cities_plot_serif, 
       height = plot_height) 
ggsave("Plots/cities_plot_sans.pdf", cities_plot_sans, 
       height = plot_height) 

#####################################################
rm(list=ls()[! ls() %in% never_delete])
