USE [master];
GO
CREATE DATABASE DiaryOnline;
GO
-- Use the database
USE DiaryOnline;
GO

-- Create the 'account' table to store username, password, and email
CREATE TABLE account (
  username VARCHAR(50) PRIMARY KEY,
  password VARCHAR(100) NOT NULL,
);
GO

-- Create the 'profile' table to store information about the user
CREATE TABLE profile (
  username VARCHAR(50) PRIMARY KEY,
  full_name NVARCHAR(100) NOT NULL,
  age INT NOT NULL,
  CONSTRAINT FK_Profile_Account FOREIGN KEY (username) REFERENCES account(username)
);
GO

-- Create the 'diary' table to store the title, time, and content of each diary entry
CREATE TABLE diary (
  id INT IDENTITY(1,1) PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  title NVARCHAR(100) NOT NULL,
  time_of_diary DATETIME NOT NULL,
  content NTEXT NOT NULL,
  CONSTRAINT FK_Diary_Account FOREIGN KEY (username) REFERENCES account(username)
);
GO

-- Create the 'friend' table to store the profiles of friends who can see the user's diary
CREATE TABLE friend (
  id INT IDENTITY(1,1) PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  friend_username VARCHAR(50) NOT NULL,
  CONSTRAINT FK_Friend_Account FOREIGN KEY (username) REFERENCES account(username),
  CONSTRAINT FK_Friend_Profile FOREIGN KEY (friend_username) REFERENCES profile(username)
);
GO

-- Create the 'diary_shared' table to store the diaries that are shared with friends
CREATE TABLE diary_shared (
  id INT IDENTITY(1,1) PRIMARY KEY,
  diary_id INT NOT NULL,
  friend_id INT NOT NULL,
  CONSTRAINT FK_DiaryShared_Diary FOREIGN KEY (diary_id) REFERENCES diary(id),
  CONSTRAINT FK_DiaryShared_Friend FOREIGN KEY (friend_id) REFERENCES friend(id)
);
GO
INSERT INTO account(username, password) VALUES ('nghia', 'nghia'),
('linh', 'linh'),
('quang', 'quang'),
('dat', 'dat'),
('dung', 'dung')
GO
INSERT INTO [profile] VALUES ('nghia', 'nghia', 20),
('linh', 'linh', 20),
('quang', 'quang', 20),
('dat', 'dat', 20),
('dung', 'dung', 20)

GO
INSERT INTO friend(username, friend_username) VALUES ('nghia', 'linh'),
('linh', 'nghia'),
('nghia', 'quang'),
('quang', 'nghia'),
('nghia', 'dat'),
('dat', 'nghia')
GO
INSERT INTO [diary](username, title, time_of_diary, content) VALUES ('nghia', N'A New Hobby', '2023-03-06 14:30:00.000', N'Today, I started a new hobby - painting! I''ve always been interested in art, but I''ve never really tried it myself. I bought some paints and canvases and started experimenting. It was a bit intimidating at first, but I quickly got into the flow of it. I painted a landscape with a mountain and a lake, and I was surprised at how well it turned out. I think I might have found a new passion!'),
('nghia', N'A Busy Day at Work', '2023-03-07 08:00:00.000', N'Today was a very busy day at work. I had several meetings and deadlines to meet, and I was running around all day trying to keep up. It was a bit stressful, but I managed to get everything done on time. I''m looking forward to a quiet evening at home to relax and recharge.'),
('nghia', N'A Trip to the Beach', '2023-03-09 11:00:00.000', N'Today, I went on a trip to the beach with some friends. It was a beautiful day, with clear blue skies and warm sunshine. We spent the day lounging on the sand, playing frisbee, and swimming in the ocean. We also had a picnic lunch and enjoyed some cold drinks. It was a much-needed break from the daily routine, and I had a lot of fun.'),
('nghia', N'A Family Reunion', '2023-03-12 16:00:00.000', N'Today, I went to a family reunion with my parents and siblings. We had a big barbecue in the park and caught up on each other''s lives. It was great to see everyone again, and we reminisced about old times and shared new stories. My aunt brought her guitar, and we sang some old family songs. It was a lovely day spent with family and good food.'),
('nghia', N'A Trip to Paris', '2022-02-14 00:00:00.000', N'Dear Diary,I just got back from an incredible trip to Paris. It''s been my dream to visit the City of Lights for as long as I can remember, and I finally made it happen.The city was just as beautiful and charming as I had imagined. I spent my days exploring museums, eating delicious food, and taking in the sights and sounds of the city.I visited the Eiffel Tower, the Louvre Museum, and the Palace of Versailles. Each of these experiences left me in awe of the city''s history and beauty.I also made some new friends on the trip and got to practice my French language skills, which was a lot of fun.This trip was a dream come true, and I feel so grateful to have had the opportunity to experience Paris for myself.'),
('nghia', N'Starting a New Hobby', '2019-05-11 00:00:00.000', N'I decided to start a new hobby this week, and it''s been such a great way to unwind and destress after work.I''ve started taking painting classes, and it''s been amazing to watch my skills improve each week. It''s also been a great way to meet new people who share my passion for art.I love how painting allows me to express myself creatively and escape from the stress of everyday life. I feel like I''m discovering a whole new side of myself through this hobby.I''m looking forward to continuing to learn and grow as an artist, and I''m excited to see where this hobby takes me.'),
('linh', N'Ngày cuối năm', '2023-12-31 23:59:59.000', N'Hôm nay là ngày cuối năm. Tôi đã dọn dẹp nhà cửa và chuẩn bị cho đêm giao thừa. Tôi đã nấu ăn và tổ chức một buổi tiệc nhỏ với gia đình. Chúng tôi đã ăn tất niên và chờ đợi đêm giao thừa đến.'),
('linh', N'Đón Tết', '2024-01-01 00:00:01.000', N'Chúc mừng năm mới! Hôm nay là ngày đầu tiên của năm mới. Tôi đã dành cả ngày để đón Tết với gia đình. Chúng tôi đã cùng nhau ăn cỗ, trao nhau lì xì và chúc nhau một năm mới tốt đẹp.'),
('linh', N'Tết dương lịch', '2024-01-01 00:00:01.000', N'Ngày hôm nay là Tết dương lịch. Tôi đã đến nhà thờ để cầu nguyện và tham dự lễ kính. Sau đó, tôi đã đi ăn sáng với gia đình và đi dạo phố để chiêm ngưỡng khung cảnh đón Tết.'),
('linh', N'Sinh nhật bạn', '2024-02-14 12:00:00.000', N'Hôm nay là sinh nhật của bạn thân của tôi. Tôi đã tổ chức một bữa tiệc nhỏ để chúc mừng sinh nhật của bạn. Chúng tôi đã ăn bánh kem và tặng nhau những món quà tuyệt vời.'),
('linh', N'Kỷ niệm ngày cưới', '2024-05-20 09:00:00.000', N'Hôm nay là kỷ niệm ngày cưới của tôi và vợ tôi. Chúng tôi đã đi ăn sáng và dạo chơi ở công viên. Sau đó, chúng tôi đã đi xem một bộ phim lãng mạn và ăn tối ở một nhà hàng sang trọng.'),
('linh', N'Đi du lịch', '2024-07-15 08:00:00.000', N'Hôm nay tôi đã đi du lịch với gia đình. Chúng tôi đã đến một khu du lịch nổi tiếng và tham quan các điểm đến hấp dẫn. Chúng tôi đã tắm biển, đi chơi và thưởng thức đồ ăn ngon.'),
('quang', N'Bắt đầu hành trình học tập mới', '2021-11-03 00:00:00.000', N'Hôm nay là ngày đầu tiên của tôi ở trường Đại học. Tôi cảm thấy hồi hộp nhưng cũng rất háo hức về những gì đang đợi tôi. Tôi mong muốn học hỏi những kiến thức mới và gặp gỡ nhiều bạn bè mới. Tôi biết rằng sẽ có nhiều khó khăn phía trước, nhưng tôi sẵn sàng đối mặt với chúng.Tôi rất biết ơn cơ hội được học tập tại trường đại học và mong muốn thấy mình phát triển và trưởng thành hơn trong tương lai.'),
('quang', N'Hành trình khám phá thành phố mới', '2022-03-01 00:00:00.000', N'Chào nhật ký,Hôm nay tôi đã quyết định đi bộ khắp thành phố để khám phá những nơi mới. Tôi thật sự thích cảm giác đi trên đường phố, quan sát mọi thứ xung quanh và khám phá những điều mới mẻ.Tôi đã ghé thăm một số công trình nổi tiếng của thành phố và thử đồ ăn địa phương. Tôi cảm thấy thật sự thích thú với những trải nghiệm mới và mong muốn khám phá nhiều hơn.Hẹn gặp lại,'),
('quang', N'Tìm thấy niềm đam mê mới', '2019-05-11 00:00:00.000', N'Chào nhật ký,Tôi đã tìm thấy niềm đam mê mới của mình - làm vườn. Tôi thích cảm giác đắm mình trong cảnh quan thiên nhiên và chăm sóc cây cối. Tôi cảm thấy rất thư giãn và đặc biệt là hạnh phúc khi nhìn thấy những loài hoa và cây cối tôi đã trồng phát triển.Tôi đang học hỏi nhiều hơn về làm vườn và mong muốn trồng thêm nhiều cây cối trong tương lai.Hẹn gặp lại,'),
('quang', N'A New Beginning', '2023-03-11 00:00:00.000', N'Dear Diary,Today marks the start of a new year and a new beginning for me. I have set some goals and resolutions for myself, and I am determined to achieve them. This year, I want to focus on my personal growth, my relationships with loved ones, and my career. I am excited for what the future holds and I can''t wait to see what this year will bring.Cheers to a new beginning,'),
('quang', N'A Day of Adventure', '2023-03-11 00:00:00.000', N'Dear Diary,Today I went on a spontaneous adventure and it was just what I needed. I hiked up a mountain, explored a new town, and tried some new foods. It was exhilarating to step out of my comfort zone and experience something new. I hope to continue to embrace adventure and make the most of every day.Until next time,')
GO
INSERT INTO diary_shared(diary_id, friend_id) VALUES (1, 2),
(1, 3),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(9, 1),
(7, 1),
(10, 1),
(2, 3)


