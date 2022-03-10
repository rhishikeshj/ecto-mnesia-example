defmodule Blog.Controller do
  alias Blog.Schemas.{User, Post, Comment}
  alias Blog.Repo
  alias Ecto.Changeset
  import Ecto.Query

  def create_post(params, user_id) do
    user = Repo.get(User, user_id)

    %Post{}
    |> Post.changeset(params)
    |> Changeset.put_assoc(:user, user)
    |> Repo.insert()
  end

  def delete_post(id) do
    Post
    |> Repo.get(id)
    |> Repo.delete()
  end

  def create_user(params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end

  def delete_user(id) do
    user = Repo.get(User, id)
    Repo.delete(user)
  end

  def create_comment(params, user_id, post_id) do
    user = Repo.get(User, user_id)
    post = Repo.get(Post, post_id)

    %Comment{}
    |> Comment.changeset(params)
    |> Changeset.put_assoc(:user, user)
    |> Changeset.put_assoc(:post, post)
    |> Repo.insert()
  end

  def delete_comment(id) do
    Comment
    |> Repo.get(id)
    |> Repo.delete()
  end

  def display_post(id) do
    Post
    |> Repo.get(id)
    |> Repo.preload([:user, comments: :user])
  end

  def list_posts() do
    query =
      from p in Post,
        order_by: [desc: p.id],
        preload: :user

    Repo.all(query)
  end
end
