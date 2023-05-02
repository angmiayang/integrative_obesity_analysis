### ### ### ### ### ### ### ### ### ### 
# The script generates heatmaps to visualize functionally validated key obesity genes using the RColorBrewer and pheatmap libraries in R.
# The script assumes the existence of a file named "functionallyValidatedKeyGenes.csv" containing the data for the analysis.
# The RColorBrewer and pheatmap libraries are loaded to access the required functions for generating heatmaps and defining color palettes.
# The "functionallyValidatedKeyGenes.csv" file is read using the read.csv function and stored in the data variable.
# The sep argument is set to "," to specify that the data in the CSV file is comma-separated.
# The check.names argument is set to FALSE to prevent the automatic conversion of column names to syntactically valid names.
# The row.names argument is set to 1 to use the first column of the CSV file as row names.
# The header argument is set to TRUE to indicate that the CSV file has a header row.
# The data_matrix variable is created by converting the data variable to a matrix using the as.matrix function.
# The number of rows and columns in data_matrix are stored in the nr and nc variables, respectively.
# A new color palette is created using the colorRampPalette and brewer.pal functions from the RColorBrewer library. The palette consists of shades of red.
# The pheatmap function is used to generate the heatmap. The data_matrix is provided as the input data.
# The key argument is set to FALSE to hide the color key.
# The col argument is set to the new color palette to define the colors used in the heatmap.
# The show_rownames argument is set to TRUE to display row names in the heatmap.
# The fontsize argument is set to 5 to adjust the font size of the row and column names.
# The cluster_rows and cluster_cols arguments are set to TRUE to perform hierarchical clustering of rows and columns, respectively.
# The clustering_distance_rows and clustering_distance_cols arguments are set to "euclidean" to specify the distance metric used for clustering.
# The clustering_method argument is set to "complete" to use complete linkage clustering.
# The cellheight and cellwidth arguments are set to 5 to adjust the height and width of the cells in the heatmap.
# The border_color argument is set to "grey60" to define the color of the border lines around the cells.
# The legend argument is set to FALSE to hide the legend.
# The filename argument is set to "functionallyValidatedKeyGenes.png" to specify the output filename for the heatmap.
### ### ### ### ### ### ### ### ### ### 


library(RColorBrewer)
library(pheatmap)

data <- read.csv(file = "functionallyValidatedKeyGenes.csv", sep = ",", check.names = FALSE, row.names = 1, header = TRUE)
data_matrix <- as.matrix(data)

nr <- dim(data_matrix)[1]
nc <- dim(data_matrix)[2]

new.palette <- colorRampPalette(brewer.pal(3, "Reds"))
pheatmap(data_matrix, key = FALSE, col = new.palette(10), show_rownames = TRUE, fontsize = 5, cluster_rows = TRUE, cluster_cols = TRUE, clustering_distance_rows = "euclidean", clustering_distance_cols = "euclidean", clustering_method = "complete", cellheight = 5, cellwidth = 5, border_color = "grey60", legend=FALSE, filename = "functionallyValidatedKeyGenes.png")
