# Install Visual Studio code
https://code.visualstudio.com/

Suggested plugins:

https://marketplace.visualstudio.com/items?itemName=mjmcloug.vscode-elixir

https://marketplace.visualstudio.com/items?itemName=sammkj.vscode-elixir-formatter

# Install Elixir
https://elixir-lang.org/install.html

# Installing Phoenix
```bash
mix local.hex && mix archive.install hex phx_new 1.4.14
```

# Creating a new project
'a_demo' is a demo name. You can choose your application name.
```bash
mix phx.new a_demo --umbrella --database mysql
```

If you want to use the school database server with PostgreSQL, leave out the '--database mysql' part. 
PostgreSQL is the default value.

Get a gitignore file for 'Phoenix', 'Elixir' and 'Node' and replace it with the current .gitignore
in the newly generated project ( http://gitignore.io/api/node,elixir,phoenix )

Make a private repository on Github.

# Push to github
In bash (in the root folder of the new project): 
```bash
git init 
```
```bash
git add . && git commit -m "init commit" 
```
## Get the link from the new repo on github
```bash
git remote add origin https://github.com/{your_username}/{your_repository}.git
```
```bash
git push -u origin master
```
### Refresh your repo to check if everything was pushed correctly
## Make a dev branch 
In bash:
```bash
git checkout -b dev
```
```bash
git push --set-upstream origin dev
```

Make a .circleci folder with a config.yml file: 
```bash
mkdir .circleci && touch .circleci/config.yml
```
### Paste the given config.yml file in the config.yml file 
```bash
git add . && git commit -m "added config" && git push
```
### Also merging it to master if needed
```bash
git checkout master
git merge dev 
git push origin master
```

# Database connection
## Make an account on https://circleci.com/ with your Github account
Go to dashboard

Select your repo "Set up project"

"Start building"

Click "Add manually" for the config file, we added this one earlier.

You will have an error the Circleci page after this. This is normal.

# Database connections
In this example, we use a remote dummy database to test the connection. If you want to use your school database, you can just add your own settings. 

Go to https://remotemysql.com and make an account and create a database
In /config/dev.exs and /config/test.exs:
Edit 'username' for 'username', 'password' for 'password', 'database name' for 'database', 'hostname' for 'server' and 'port' for 3306.
### Port is a bit trickier to find in the files

# Configurating Circleci
Delete these lines: 
```yml
      - image: circleci/postgres:10.1-alpine  # database image
        environment:  # environment variables for database
          POSTGRES_USER: postgres
          POSTGRES_DB: app_test
          POSTGRES_PASSWORD:
```

and replace it with this: 
```yml
- image: circleci/mysql:latest  # database image
        environment:  # environment variables for database
          MYSQL_ROOT_PASSWORD: t
```

The 't' should be your password for your MySQL database.
Replace the '5432' port with '3306'.

Change 
```yml
    working_directory: ~/app  # directory where steps will run
```
to:

```yml
    working_directory: ~  # directory where steps will run
```

Change
```yml
      - image: circleci/elixir:1.7.3  # ...with this image as the primary container; this is where all `steps` will run
```

to:

```yml
      - image: circleci/elixir:1.9  # or 1.10, up to you
```

Change 'REPLACE_WITH_YOUR_APP_NAME' 

```yml
- store_test_results:  # upload junit test results for display in Test Summary
          # Read more: https://circleci.com/docs/2.0/collect-test-data/
          path: _build/test/lib/REPLACE_WITH_YOUR_APP_NAME # Replace with the name of your :app
```
to your project name.

# Test if your current configuration works

Execute the following commands:

```bash
mix test
```

Should give the following output:

```text
==> a_demo


Finished in 0.00 seconds
0 failures

Randomized with seed 135691
==> a_demo_web
...

Finished in 0.07 seconds
3 tests, 0 failures

Randomized with seed 135691

```

## Second test
Previous 'mix test' didn't really have tests to be tested, so we'll add a dummy test file.

In your /apps/a_demo/test/ directory, make a dummy_test.exs file. 

```elixir
# Filename: /apps/a_demo/test/dummy_test.exs
defmodule DummyTest do
  use ExUnit.Case, async: true

  test "the truth" do
    assert true
  end
end
```

You can put this in and run
```bash
mix test 
```
again.

If the test passed, you can push to your dev branch. 

```bash
    git push --set-upstream origin dev
```

## This intro ends here and can be continued on the 246th line of the guide (https://github.com/WannesFransen1994/ip_major/blob/master/lesson_03/circleci_guide/guide.md#aggregating-our-test-reports)
