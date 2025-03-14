Rails.application.routes.draw do
  root "g_scores#search"
  get "/report", to: "g_scores#report"
end
