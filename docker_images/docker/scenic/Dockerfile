# Based on rocker - https://github.com/rocker-org/rocker-versioned2
FROM rocker/tidyverse:4.1.2

MAINTAINER Laurent.Hannouche (hannouche@ciml.univ-mrs.fr)



# ##############################
# R packages system dependencies
# ##############################

RUN apt-get update && apt-get install -y optipng \
                                         pandoc \
                                         libpng-dev \
                                         zlib1g-dev \
                                         libssl-dev \
                                         libcurl4-openssl-dev \
                                         libglpk-dev 

                                      
# ##########
# R PACKAGES 
# ##########

#### BiocManager
RUN Rscript -e 'install.packages( "BiocManager")'


#### RMarkdown & Reporting
RUN Rscript -e 'install.packages( "knitr")'
RUN Rscript -e 'install.packages( "rmarkdown")'
RUN Rscript -e 'install.packages( "bookdown")'
RUN Rscript -e 'install.packages( "htmltools")'      # browsable


#### Figures & layout management
# ggplot2
RUN Rscript -e 'install.packages( "ggplot2")'
RUN Rscript -e 'install.packages( "cowplot")'        # plot_grid, themes, ...
RUN Rscript -e 'install.packages( "ggpubr")'         # add_summary, geom_signif, ...
RUN Rscript -e 'install.packages( "ggrepel")'        # geom_text_repel, geom_label_repel
RUN Rscript -e 'install.packages( "gridExtra")'      # grid.arrange, ...
RUN Rscript -e 'BiocManager::install( "patchwork")'  # +/ operators for ggplots

# plotly
RUN Rscript -e 'install.packages( "plotly")'

# general
RUN Rscript -e 'install.packages( "gplots")'         # heatmap.2
RUN Rscript -e 'install.packages( "heatmaply")'      # heatmaply (interactive)
RUN Rscript -e 'BiocManager::install( "iheatmapr")'  # iheatmap (interactive, uses plotly), dependencies OK with BiocManager
RUN Rscript -e 'install.packages( "pheatmap")'       # pheatmap


#### Reporting
RUN Rscript -e 'install.packages( "DT")'             # datatable
RUN Rscript -e 'install.packages( "htmlwidgets")'    # JS (for datatable)
RUN Rscript -e 'install.packages( "kableExtra")'     # kable_styling
RUN Rscript -e 'install.packages( "pander")'         # pander


#### General
RUN Rscript -e 'install.packages( "digest")'         # digest (hashing)
RUN Rscript -e 'install.packages( "dplyr")'
RUN Rscript -e 'install.packages( "forcats")'        # fct_inorder (factors)
RUN Rscript -e 'install.packages( "funr")'           # get_script_path
RUN Rscript -e 'install.packages( "future")'         # plan (multicore)
RUN Rscript -e 'install.packages( "fs")'             # path_sanitize
RUN Rscript -e 'install.packages( "magrittr")'
RUN Rscript -e 'install.packages( "reshape")'        # melt
RUN Rscript -e 'install.packages( "scales")'         # hue_pal


#### Technology specific

# Seurat
RUN Rscript -e 'BiocManager::install( "Seurat")'     # Dependencies OK with BiocManager (https://github.com/satijalab/seurat/issues/2409)
RUN Rscript -e 'BiocManager::install( "limma")'      # As recommended by Seurat for efficient Wilcoxon implementation 
RUN Rscript -e 'install.packages( "umap")'
RUN Rscript -e 'BiocManager::install("scater")'


#### SM
RUN Rscript -e 'install.packages( "sm")'

# Monocle 3
#RUN apt-get update && apt-get install -y libxml2-dev \
#                                         libudunits2-dev \
#                                         libgdal-dev \
#                                         libgeos-dev \
#                                         libproj-dev

#RUN Rscript -e 'BiocManager::install( "BiocGenerics")'
#RUN Rscript -e 'BiocManager::install( "DelayedArray")'
#RUN Rscript -e 'BiocManager::install( "DelayedMatrixStats")'
#RUN Rscript -e 'BiocManager::install( "limma")'
#RUN Rscript -e 'BiocManager::install( "S4Vectors")'
RUN Rscript -e 'BiocManager::install( "SingleCellExperiment")'
RUN Rscript -e 'BiocManager::install( "SummarizedExperiment")'
#RUN Rscript -e 'BiocManager::install( "batchelor")'
#RUN Rscript -e 'BiocManager::install( "Matrix.utils")'

#RUN Rscript -e 'install.packages("devtools"); \
#                devtools::install_github("cole-trapnell-lab/leidenbase"); \
#                devtools::install_github("cole-trapnell-lab/monocle3");


#### Custom (RFutils and dependencies)

#ENV RFUTILS_VERSION 0.1.4

RUN apt-get update && apt-get install -y curl \
                                         libbz2-dev \
                                         libjpeg-dev \
                                         liblzma-dev \
                                         libxml2-dev

RUN Rscript -e 'BiocManager::install( "GenomicRanges")'
RUN Rscript -e 'BiocManager::install( "rtracklayer")'
RUN Rscript -e 'BiocManager::install( "topGO")'
RUN Rscript -e 'BiocManager::install( "Gviz")'

#RUN curl -#LO "https://bitbucket.org/rfenouil/general_utilities/raw/master/RPackages/RFutils_${RFUTILS_VERSION}.tar.gz" \
#    && R CMD INSTALL RFutils_${RFUTILS_VERSION}.tar.gz \
#    && rm RFutils_${RFUTILS_VERSION}.tar.gz

# cMAP
RUN apt-get install -y libtcl8.6
RUN apt-get install -y libtk8.6

RUN Rscript -e 'install.packages( "tcltk")'
RUN Rscript -e 'install.packages( "qpcR")'

RUN apt-get install -y libglu1


# Install Python 3
RUN apt-get update
RUN apt-get install -y python3.8
RUN apt-get install -y python3.8-dev
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-venv
RUN echo "alias python=python3" >> ~/.bashrc
RUN ln -sfn /usr/bin/python3.8 /usr/bin/python3 && ln -sfn /usr/bin/python3 /usr/bin/python && ln -sfn /usr/bin/pip3 /usr/bin/pip
#/root/.cache/pip/wheels/5f/fd/9e/b6cf5890494cb8ef0b5eaff72e5d55a70fb56316007d6dfe73

# MAGIC (Markov Affinity-based Graph Imputation of Cells)
RUN Rscript -e 'install.packages("Rmagic")'
RUN pip3 install magic-impute 

RUN apt-get install -y libxtst6
RUN Rscript -e 'install.packages("devtools")'
RUN Rscript -e 'devtools::install_github("powellgenomicslab/DropletQC", build_vignettes = TRUE)'
RUN Rscript -e 'BiocManager::install("Rsamtools")'
RUN Rscript -e 'BiocManager::install("slingshot")'
RUN Rscript -e 'install.packages("rsample")'
RUN Rscript -e 'install.packages("rminer")'
RUN Rscript -e 'install.packages("parsnip")'
RUN Rscript -e 'install.packages("ranger")'
RUN Rscript -e 'install.packages("gam")'
RUN Rscript -e 'install.packages("remotes")'
RUN Rscript -e 'devtools::install_github("statOmics/tradeSeq")'
RUN Rscript -e 'BiocManager::install("TrajectoryUtils")'
RUN Rscript -e 'BiocManager::install("scater")'
RUN Rscript -e 'BiocManager::install("AUCell")'
RUN Rscript -e 'BiocManager::install("GSEABase")'
RUN Rscript -e 'install.packages("NMF")'
RUN Rscript -e 'BiocManager::install("GEOquery")'
RUN Rscript -e 'install.packages("viridisLite")'
RUN Rscript -e 'install.packages("utils")'
RUN Rscript -e 'BiocManager::install("condiments")'
