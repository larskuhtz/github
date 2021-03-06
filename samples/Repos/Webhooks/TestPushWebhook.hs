module TestPushWebhook where

import Github.Repos.Webhooks
import qualified Github.Auth as Auth

main :: IO ()
main = do
  let auth = Auth.GithubOAuth "oauthtoken"
  resp <- testPushRepoWebhook' auth "repoOwner" "repoName" 123
  case resp of
    (Left err) -> putStrLn $ "Error: " ++ (show err)
    (Right stat) -> putStrLn $ "Resp: " ++ (show stat)
