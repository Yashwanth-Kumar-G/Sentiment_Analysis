install.packages(c("tidyverse", "tidytext", "textdata", "wordcloud", "RColorBrewer"))
library(tidyverse)
library(tidytext)
library(textdata)
library(wordcloud)
library(RColorBrewer)

movie_reviews <- data.frame(
  id = 1:15,
  text = c(
    "I love this movie, it's fantastic!",
    "This film was boring and too long.",
    "A masterpiece that was well worth the watch.",
    "I didn't like it, the plot was weak.",
    "One of the best movies I've seen!",
    "Terrible movie, I want my time back.",
    "The acting was superb and the cinematography stunning.",
    "I hated every minute, such a waste of time.",
    "An absolute joy to watch, highly recommended!",
    "Poorly executed with a predictable storyline.",
    "Great direction and outstanding performances.",
    "The soundtrack was amazing, it gave me chills.",
    "The movie lacked depth and character development.",
    "It was an emotional rollercoaster, I cried and laughed!",
    "Completely forgettable, I won't watch it again."
  ),
  stringsAsFactors = FALSE
)

tidy_reviews <- movie_reviews %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)

sentiment_scores <- tidy_reviews %>%
  inner_join(get_sentiments("bing")) %>%
  count(id, word, sentiment) %>%
  ungroup()

top_common <- tidy_reviews %>%
  count(word, sort = TRUE) %>%
  top_n(10)


# Top 10 Most Frequent Words
ggplot(top_common, aes(x = reorder(word, n), y = n, fill = n)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = n), hjust = -0.2, size = 4) +
  coord_flip() +
  scale_y_continuous(expand = expansion(mult = c(0, .2))) +
  labs(title = "Top 10 Most Frequent Words", x = "Word", y = "Frequency") +
  scale_fill_gradient(low = "skyblue", high = "blue") +
  theme_minimal(base_size = 14)

# Sentiment Words by Count
ggplot(sentiment_scores, aes(x = reorder(word, n), y = n, fill = sentiment)) +
  geom_col(width = 0.6, show.legend = FALSE) +
  geom_text(aes(label = n), hjust = -0.2, size = 4) +
  facet_wrap(~sentiment, scales = "free_y") +
  coord_flip() +
  scale_y_continuous(expand = expansion(mult = c(0, .2))) +
  labs(title = "Sentiment Words by Count", x = "Words", y = "Frequency") +
  theme_minimal(base_size = 14)

# Word Clouds
positive_words <- sentiment_scores %>% filter(sentiment == "positive")
negative_words <- sentiment_scores %>% filter(sentiment == "negative")
wordcloud(positive_words$word, positive_words$n, min.freq = 1, scale = c(4, 0.5), colors = brewer.pal(8, "Greens"))
wordcloud(negative_words$word, negative_words$n, min.freq = 1, scale = c(4, 0.5), colors = brewer.pal(8, "Reds"))

# Pie Chart for Sentiment Distribution
sentiment_pie <- sentiment_scores %>%
  group_by(sentiment) %>%
  summarise(total = sum(n))
ggplot(sentiment_pie, aes(x = "", y = total, fill = sentiment)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  scale_fill_manual(values = c("red", "green")) +
  labs(title = "Overall Sentiment Distribution") +
  theme_void() +
  theme(legend.position = "right", plot.title = element_text(size = 16, face = "bold"))


tryCatch({ textdata::lexicon_nrc() }, error = function(e) { textdata::lexicon_nrc() })
nrc_sentiments <- get_sentiments("nrc")

# Emotion Distribution
emotion_scores <- tidy_reviews %>%
  inner_join(nrc_sentiments) %>%
  count(sentiment)
ggplot(emotion_scores, aes(x = reorder(sentiment, n), y = n, fill = sentiment)) +
  geom_bar(stat = "identity", width = 0.6) +
  geom_text(aes(label = n), hjust = -0.2, size = 4) +
  coord_flip() +
  scale_y_continuous(expand = expansion(mult = c(0, .2))) +
  labs(title = "Emotion Distribution (NRC Lexicon)", x = "Emotion", y = "Count") +
  scale_fill_brewer(palette = "Set3") +
  theme_minimal(base_size = 14)
