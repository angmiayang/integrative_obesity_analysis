### ### ### ### ### ### ### ### ### ### 
# The script generates barplots for Gene Ontology (GO) analysis using the ggplot2 and tidyverse libraries in R.
# The script assumes the existence of a file named "GO_analysis.csv" containing the data for the analysis.
# The "GO_analysis.csv" file is read using the read.csv function and stored in the data variable.
# The data variable is then processed using the %>% pipe operator to chain multiple operations.
# The Module column in the data variable is converted to a factor with specific order levels: "Cellular Component", "Molecular Function", and "Biological Process".
# The data variable is sorted by the Module column.
# A ggplot object is created using ggplot(), with data as the data source.
# The aesthetics mappings are defined using aes(), where x represents the ordered Term variable, y represents the negative base-10 logarithm of the Adjusted.P.value, and fill represents the Module variable in reverse order.
# A bar plot is created using geom_bar() with stat = "identity" to use the actual values as bar heights and position = "dodge" to create side-by-side bars.
# The fill colors of the bars are set using scale_fill_brewer() with the "Set1" color palette.
# The plot is flipped horizontally using coord_flip() to create horizontal barplots.
# The x-axis label is set to "Term" using xlab().
# The y-axis label is set to "-log10(Adjusted p-value)" using ylab().
# The legend for the fill colors is created using guides(fill = guide_legend(title = "Module")).
### ### ### ### ### ### ### ### ### ### 


library(ggplot2)
library(tidyverse)

data <- read.csv("GO_analysis.csv")

data %>%
  mutate(Module = factor(Module, levels = c("Cellular Component", "Molecular Function", "Biological Process"))) %>%
  arrange(Module) %>%
  ggplot(aes(x = fct_inorder(Term), y = -log10(Adjusted.P.value), fill = fct_rev(Module))) +
  geom_bar(stat = "identity",  position = "dodge") +
	scale_fill_brewer(palette = "Set1") +
  coord_flip() +
  xlab("Term") +
  ylab("-log10(Adjusted p-value)") +
  guides(fill=guide_legend(title = "Module"))
