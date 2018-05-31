using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SQLQuery
/// </summary>
public class SQLQuery
{
    /// <summary>
    /// Insert into news
    /// </summary>
    public const string NewsInsert = "Insert into news(Title, Author, Content, CreateDate, Image) VALUES (@Title, @Author, @Content, @CreateDate, @Image)";

    /// <summary>
    /// Insert Activation code for new registered user
    /// </summary>
    public const string InsertActivationCode = "INSERT INTO UserActivation VALUES(@UserId, @ActivationCode)";

    /// <summary>
    /// Insert a new project
    /// </summary>
    public const string CreateProject = "Insert into projects(Title, Description, ProjectDetails, CreateDate, Images, Subheading) VALUES (@Title, @Description, @ProjectDetails, @CreateDate, @Images, @Subheading)";
}