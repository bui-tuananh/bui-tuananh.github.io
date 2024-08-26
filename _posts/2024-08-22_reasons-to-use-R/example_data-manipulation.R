
# Ví dụ dùng R để xử lý dữ liệu

# Tải thư viện --------
library(tidyverse)     # xử lý dữ liệu bảng
library(stars)         # xử lý dữ liệu raster 

# Tải dữ liệu ---------
# dữ liệu vị trí lấy mẫu
sample <- read_csv("./sample.csv")

# dữ liệu raster nhiệt độ
temp <- read_stars("./temp.tif")

# Xử lý dữ liệu -------
# 1. lọc các hàng với các loài và các khu vực quan tâm
data <- sample %>%
  filter(species %in% c("loài A", "loài B", "loài C"),
         population %in% c("khu vực X", "khu vực Y", "khu vực Z")) 

# 2. trích xuất dữ liệu từ file raster
data_sf <- st_as_sf(data) # đổi định dạng bảng sang dạng không gian
temp_extract <- st_extract(temp, sample_sf)

# 3. kết hợp bảng gốc với bảng trích xuất nhiệt độ
data_sf_temp <- data_sf %>% 
  left_join(temp_extract)

# 4,5,6,....

# lưu dữ liệu
write_csv(data_sf_temp, "./data.csv")
