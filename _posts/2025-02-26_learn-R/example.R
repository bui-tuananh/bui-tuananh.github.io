# Ví dụ sử dụng RStudio

# Tải thư viện
library(tidyverse)

# Tạo dữ liệu giả định
x = rnorm(1000, 0, 1)
y = x*2 + rnorm(1000, 0, 0.5)

df <- tibble(x = x, y = y)

ggplot(data = df, aes(x = x, y = y)) +
  geom_point() +
  theme_bw()
