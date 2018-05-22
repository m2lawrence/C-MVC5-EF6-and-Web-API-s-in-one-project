SET IDENTITY_INSERT [dbo].[Employee] ON

GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Position], [Age], [Salary]) VALUES (1, N'Mike', N'Developer', 22, 251000)
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Position], [Age], [Salary]) VALUES (2, N'Emma', N'Developer', 23, 266000)
GO 
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Position], [Age], [Salary]) VALUES (3, N'Mike', N'Developer', 24, 277000)
GO

SET IDENTITY_INSERT [dbo].[Employee] OFF
GO