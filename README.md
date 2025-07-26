# 🎬 Sentiment Analysis of Movie Reviews

This project demonstrates a **Sentiment Analysis** pipeline in **R** that analyzes movie reviews to classify them as **positive** or **negative**. Using **text mining** techniques and the **Bing sentiment lexicon**, the project extracts meaningful insights from raw text data and visualizes them with **ggplot2**.

---

## 🌟 Overview

Sentiment Analysis is a Natural Language Processing (NLP) technique used to determine the emotional tone behind words.  
In this project:
- Movie reviews are processed to identify sentiment-bearing words.
- Each word is classified as either **positive** or **negative**.
- The results are visualized using **faceted bar charts** for better interpretation.

This analysis helps understand how viewers feel about movies based on the words they use in their reviews.

---

## 📊 Example Output

The output visualization shows the most frequent **negative** and **positive** words extracted from the sample dataset.

![Sentiment Analysis Visualization](sentiment_plot.png)

- **Negative Words:** weak, terrible, plot, boring  
- **Positive Words:** worth, masterpiece, love, fantastic  

---

## 🔥 Key Features

✔️ **Tokenization** – Breaks text into individual words  
✔️ **Stop-word Removal** – Removes non-informative words like "and", "the", etc.  
✔️ **Sentiment Classification** – Uses the **Bing lexicon** to label words as positive or negative  
✔️ **Data Visualization** – Displays sentiment results using **ggplot2** faceted bar plots  

---

## 🛠️ Technologies Used

- **R Programming Language**  
- **tidyverse** – Data manipulation and visualization  
- **tidytext** – Text mining  
- **textdata** – Access to sentiment lexicons  

---

## ⚡ Installation & Requirements

### Software
- [R](https://cran.r-project.org/) (version 4.0 or later)
- [RStudio](https://posit.co/download/rstudio-desktop/) (recommended)

### Install Required R Packages

```R
install.packages("tidyverse")   # Data manipulation and plotting
install.packages("tidytext")    # Text mining
install.packages("textdata")    # Sentiment lexicons
```

---

### 📈 Results & Insights
- Positive reviews often include words like love, fantastic, worth, and masterpiece.
- Negative reviews frequently contain words like boring, weak, terrible, and plot.
- These insights help understand viewer perception and can be applied to larger datasets.

---

### 🚀 Future Enhancements
- Use a larger dataset of real-world movie reviews
- Implement other sentiment lexicons (AFINN, NRC)
- Build an interactive Shiny dashboard
- Incorporate machine learning models for advanced sentiment analysis


