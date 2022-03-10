defmodule Blog.Repo.Migrations.Initial do
  alias Ecto.Adapters.Mnesia.Migration
  Migration.create_table(Blog.Repo, Blog.Schemas.User, [])
  Migration.create_table(Blog.Repo, Blog.Schemas.Post, [])
  Migration.create_table(Blog.Repo, Blog.Schemas.Comment, [])    
end
