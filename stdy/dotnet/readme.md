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
  dotnet ef
  dotnet build
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
If instead you got a screen like this one: 
```
The specified framework 'Microsoft.NETCore.App', version '1.0.0' was not found.
  - Check application dependencies and target a framework version installed at:
      /
  - Alternatively, install the framework version '1.0.0'.
```
Install the .NET Core 1 as suggested. It can be found at [https://github.com/dotnet/core/blob/master/release-notes/download-archives/1.0.5-download.md](https://github.com/dotnet/core/blob/master/release-notes/download-archives/1.0.5-download.md)


5. Check if the project is still building:
```
dotnet build
``` 

