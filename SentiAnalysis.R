install.packages("tidyverse")  # For data manipulation and visualization
install.packages("tidytext")    # For text mining
install.packages("textdata")    # For accessing sentiment lexicons
# Load libraries
library(tidyverse)
library(tidytext)
library(textdata)

# Sample dataset of movie reviews
movie_reviews <- data.frame(
  text = c("I love this movie, it's fantastic!",
           "This film was boring and too long.",
           "A masterpiece that was well worth the watch.",
           "I didn't like it, the plot was weak.",
           "One of the best movies I've seen!",
           "Terrible movie, I want my time back."),
  stringsAsFactors = FALSE
)

# Tokenize and clean the data
tidy_reviews <- movie_reviews %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)

# Perform sentiment analysis
sentiment_scores <- tidy_reviews %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment) %>%
  ungroup()

# Calculate overall sentiment
overall_sentiment <- sentiment_scores %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)

print(overall_sentiment)

# Visualize sentiment scores
sentiment_scores %>%
  ggplot(aes(x = reorder(word, n), y = n, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(title = "Sentiment Analysis of Movie Reviews",
       x = "Words",
       y = "Count") +
  coord_flip()
