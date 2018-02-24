# .Net Core on a container
https://docs.docker.com/engine/examples/dotnetcore/


## SDK on Mac OSX
1. Install SDK
[link](https://www.microsoft.com/net/learn/get-started/macos)

Create an app
```
dotnet new console -o myApp
cd myApp
```
> Following steps dwell on the matters of creating and executing a simple console app


## Visual Studio for Mac Steps

from the tutorial [https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-web-api-mac](https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-web-api-mac)


## Command Line Steps 

### Create project
1. Put project creation commands in here
```
dotnet new webapi <project-name>
```

### Entity Framework Dependencies
2. Once the project is created, install the dependencies, one must be inside the folder with the <project-name>.csproj file
```
  dotnet add package Microsoft.EntityFrameworkCore
  dotnet add package Microsoft.NETCore.App
  dotnet add package Microsoft.EntityFrameworkCore.Design
  dotnet add package Microsoft.EntityFrameworkCore.SqlServer
  dotnet add package Microsoft.EntityFrameworkCore.Tools.DotNet
```

3. add the following to the csproj file: 
```
  <PropertyGroup>

    <TargetFramework>netcoreapp2.0</TargetFramework>
    <RuntimeFrameworkVersion>2.0.5</RuntimeFrameworkVersion>

  </PropertyGroup>

<ItemGroup>
    <DotNetCliToolReference Include="Microsoft.EntityFrameworkCore.Tools.DotNet" Version="2.0.0" />
</ItemGroup>
```
4. Restore the project so that all dependencies are checked upon
```
dotnet restore
```
5. In order to make sure it all went ok, run the following command
```
dotnet ef 
```
A screen like this should appear 
```

                     _/\__
               ---==/    \\
         ___  ___   |.    \|\
        | __|| __|  |  )   \\\
        | _| | _|   \_/ |  //|\\
        |___||_|       /   \\\/\\

Entity Framework Core .NET Command Line Tools 2.0.1-rtm-125

Usage: dotnet ef [options] [command]

Options:
  --version        Show version information
  -h|--help        Show help information
  -v|--verbose     Show verbose output.
  --no-color       Don't colorize output.
  --prefix-output  Prefix output with level.

Commands:
  database    Commands to manage the database.
  dbcontext   Commands to manage DbContext types.
  migrations  Commands to manage migrations.

Use "dotnet ef [command] --help" for more information about a command.
```

6. Check if the project is still building:
```
dotnet build
``` 

7. Generate the scaffold from your database in the following command: 
```
dotnet ef dbcontext scaffold "Server=10.0.0.12,1401;Initial Catalog=orders;User Id=sa;Password=strong5password1avoid2special3characters4"  Microsoft.EntityFrameworkCore.SqlServer -f -c OrdersDbContext -o Db --json
```
The command above can be described as the one responsible for reading out your database and generating your scaffold poco entity classes and the dbcontext file. It requires a basic working connection string, the parameter `f` forces the overwrite, the `c` gives the context a name, the `o` determines the output folder and the whole thing namespace and the `json` parameter outputs the command result in json instead of a zero stout.

> it is very important to keep this command at hand, if you are one of those who rather change the database and then have it reflected thoughtout your ORM, this command is for you and it will be used very often.


