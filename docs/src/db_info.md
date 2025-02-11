# Clasnip Database Information

Clasnip performs sample classification based on specialized databases. When creating a database, Clasnip automatically analyzes performance based on the samples in the database. The database information and performance reports are accessible by all users. 

To browse database information and performance reports, go to **Menu** (top bar) -> **Database Information** -> **Choose A Clasnip Database **.

## Database information

### Metadata

Database metadata includes:

- **Database ID**: The unique ID of clasnip database.
- **Taxonomy**: Ccientific name, and taxonomy level.
- **Group By**: What are the samples grouped by? Eg: species, stains, haplotypes.
- **Region**: What region/genes are covered?
- **Reference Sequence**: The reference sequence used for mapping. If it contains `.pan.`, it is a pan-genome containing not only the reference sequence, but also unmapped regions from other samples. 
- **Created By**: A user who creates the database.
- **Date Created**: Date in the format of `YYYY-MM-DD`.

### Classification groups

This section lists classification groups in the database.

### Accuracy

The percent of accuracy computed based on the samples in the database.

```math
Accuracy = (TP + TN) / (TP + TN + FP + FN)
```

where

- **TP** (True Positive) = Group X sample correctly identified as X.
- **TN** (True Negative) = Non group X sample correctly identified as not X.
- **FP** (False Positive) = Non group X sample incorrectly identified as X.
- **FN** (False Negative) = Group X sample incorrectly identified as not X.

## Detailed classification performance

### Heatmaps and dendrograms

Several plots were generated using different data in the forms of heatmap and dendrogram. Plots may automatically hided, you need to click "**Dendrogram**", or the sub-buttons under **Heatmap** to view the plot. 

The plots are interactive, and you can

- **resize the plot** by dragging the bottom-right corner of the canvas.
- **hover** on heatmap cells to show the description of X and Y axises, and numbers. 


!!! warn
    Some plots might be very big and take a while to show and resize.


#### Group Similarity Based on Sample Identities

