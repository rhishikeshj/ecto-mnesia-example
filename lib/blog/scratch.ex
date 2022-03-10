defmodule Blog.Scratch do
  alias Blog.Repo
  alias Blog.Schemas.{User, Post, Comment}
  alias Blog.Controller
  
  def eval do
    {:ok, user} = Repo.insert(%User{username: "dostoevsky007"})

    {:ok, post} =
      Repo.insert(%Post{
        post_text:
          "ALEXEY Fyodorovitch Karamazov was the third son of Fyodor Pavlovitch Karamazov, a landowner well known in our district in his own day, and still remembered among us owing to his gloomy and tragic death, which happened thirteen years ago, and which I shall describe in its proper place.",
        user: user
      })

    {:ok, user2} = Repo.insert(%User{username: "tolstoy1828"})

    {:ok, comment} =
      Repo.insert(%Comment{
        comment_text:
          "Happy families are all alike; every unhappy family is unhappy in its own way.",
        post: post,
        user: user2
      })

    IO.inspect(Repo.get(Post, post.id) |> Repo.preload(:comments), label: "Post")
    IO.inspect(Controller.list_posts, label: "All posts")
  end
end
