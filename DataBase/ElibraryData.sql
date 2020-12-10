USE [elibraryDB]
GO
INSERT [dbo].[admin_login_tb1] ([username], [password], [full_name]) VALUES (N'aaa', N'bbb', N'darling')
GO
INSERT [dbo].[author_master_tb1] ([author_id], [author_name]) VALUES (N'1', N'Tammy')
INSERT [dbo].[author_master_tb1] ([author_id], [author_name]) VALUES (N'2', N'Gary')
INSERT [dbo].[author_master_tb1] ([author_id], [author_name]) VALUES (N'3', N'Gimmy')
INSERT [dbo].[author_master_tb1] ([author_id], [author_name]) VALUES (N'4', N'Tom')
GO
INSERT [dbo].[book_issue_tb1] ([member_id], [member_name], [book_id], [book_name], [issue_date], [due_date]) VALUES (N'abc123', N'asd', N'a001', N'笨蛋這麼多是有理的', N'2020-12-01', N'2020-12-09')
INSERT [dbo].[book_issue_tb1] ([member_id], [member_name], [book_id], [book_name], [issue_date], [due_date]) VALUES (N'aaa001', N'Justin', N'a002', N'地方稅務資訊作業平台移轉計畫書', N'2020-12-08', N'2020-12-13')
GO
INSERT [dbo].[book_master_tb1] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [book_cost], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (N'a001      ', N'笨蛋這麼多是有理的', N'History,Textbook', N'Tom', N'dada', N'2020-12-09', N'Mandarin', N'1st', N'199       ', N'350       ', N'馬英九的歷史定位？這本書封面告訴你.....', N'10        ', N'9         ', N'~/book_inventory/笨蛋這麼多是有理的.jpg')
INSERT [dbo].[book_master_tb1] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [book_cost], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (N'a002      ', N'地方稅務資訊作業平台移轉計畫書', N'Action,Adventure,Comic Book', N'Tammy', N'kiki', N'2020-12-09', N'Mandarin', N'1st', N'599       ', N'800       ', N'地方稅務資訊作業平台移轉計畫書封面書影', N'10        ', N'9         ', N'~/book_inventory/地方稅務資訊作業平台移轉計畫書.jpg')
INSERT [dbo].[book_master_tb1] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [book_cost], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (N'a003      ', N'笨蛋這麼多是有理的aa', N'History,Textbook', N'Tom', N'dada', N'2020-12-09', N'Mandarin', N'1st', N'199       ', N'350       ', N'馬英九的歷史定位？這本書封面告訴你.....', N'10        ', N'10        ', N'~/book_inventory/笨蛋這麼多是有理的.jpg')
GO
INSERT [dbo].[member_master_tb1] ([full_name], [dob], [contact_no], [email], [city], [district], [pincode], [full_address], [member_id], [password], [account_status]) VALUES (N'Justin', N'1995-05-05', N'0987654321', N'aac@yahoo.com.tw', N'Taipei', N'Daan', N'20111', N'Daan Street', N'aaa001', N'aaa001', N'active')
INSERT [dbo].[member_master_tb1] ([full_name], [dob], [contact_no], [email], [city], [district], [pincode], [full_address], [member_id], [password], [account_status]) VALUES (N'Jimmy', N'1999-12-01', N'564654', N'asdas23d1@yahoo.com.tw', N'Taipei', N'Xinyi', N'210', N'asd', N'abc123', N'abc123', N'pending')
INSERT [dbo].[member_master_tb1] ([full_name], [dob], [contact_no], [email], [city], [district], [pincode], [full_address], [member_id], [password], [account_status]) VALUES (N'Tommy', N'1998-12-12', N'123456', N'4564@gmail.com', N'Taipei', N'Xinyi', N'201', N'ddddd', N'qweqwe22', N'', N'active')
GO
INSERT [dbo].[publisher_master_tb1] ([publisher_id], [publisher_name]) VALUES (N'1         ', N'kiki')
INSERT [dbo].[publisher_master_tb1] ([publisher_id], [publisher_name]) VALUES (N'2         ', N'gigi')
INSERT [dbo].[publisher_master_tb1] ([publisher_id], [publisher_name]) VALUES (N'3         ', N'dada')
INSERT [dbo].[publisher_master_tb1] ([publisher_id], [publisher_name]) VALUES (N'4         ', N'gaga')
GO
