# Sentiment_Analysis

Sentiment analysis is the process of analyzing digital text to determine if the emotional tone of the message is positive, negative, or neutral. Today, companies have large volumes of text data like emails, customer support chat transcripts, social media comments, and reviews. Sentiment analysis tools can scan this text to automatically determine the author’s attitude towards a topic. Companies use the insights from sentiment analysis to improve customer service and increase brand reputation. 

# Sentiment Analysis of Movie Reviews

This project demonstrates a simple sentiment analysis pipeline using R, focusing on analyzing a dataset of movie reviews. The workflow involves text tokenization, stop-word removal, sentiment scoring with the **Bing** lexicon, and visualization of results.

---

## Features
- Tokenizes and cleans text data.
- Removes common stop words to focus on meaningful words.
- Performs sentiment analysis using the **Bing** lexicon for positive and negative word classification.
- Visualizes sentiment scores using bar charts.

---

## Requirements

To run this project, you need the following:

### Software
- R (version 4.0 or later recommended)

### R Packages
Install the required packages with the following commands:
```R
install.packages("tidyverse")  # For data manipulation and visualization
install.packages("tidytext")   # For text mining
install.packages("textdata")   # For accessing sentiment lexicons
