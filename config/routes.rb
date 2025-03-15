Rails.application.routes.draw do
  root "g_scores#search"
  get "/report", to: "g_scores#report"
  get "/top_ten", to: "g_scores#top_ten"
end
