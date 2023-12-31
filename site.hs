--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
import           Hakyll.Web.Sass
import           Data.List (isInfixOf)
import           System.FilePath.Posix (splitFileName,takeBaseName
                                        ,takeDirectory, (</>), replaceDirectory)


--------------------------------------------------------------------------------
-- The functions and layout were borrowed from:
-- https://github.com/charukiewicz/charukiewicz

stylesheetRoute :: Routes
stylesheetRoute = customRoute cssRoute
  where
    cssRoute ident = "css" </> (takeBaseName $ toFilePath ident) ++ ".css"

-- replace a foo/bar.md by foo/bar/index.html
-- this way the url looks like: foo/bar in most browsers
niceRoute :: Routes
niceRoute = customRoute createIndexRoute
  where
    createIndexRoute ident =
        takeDirectory (toFilePath ident) </> takeBaseName (toFilePath ident) </> "index.html"

baseRoute :: Routes
baseRoute = customRoute base
  where
    base ident = replaceDirectory (toFilePath ident) ""

niceBaseRoute :: Routes
niceBaseRoute = customRoute base
    where 
      base ident = takeBaseName (toFilePath ident) </> "index.html"

-- replace url of the form foo/bar/index.html by foo/bar
removeIndexHtml :: Item String -> Compiler (Item String)
removeIndexHtml item = return $ fmap (withUrls removeIndexStr) item
  where
    removeIndexStr :: String -> String
    removeIndexStr url = case splitFileName url of
        (dir, "index.html") | isLocal dir -> dir
        _                                 -> url
    isLocal :: [Char] -> Bool
    isLocal uri = not (isInfixOf "://" uri)

directory :: (Pattern -> Rules a) -> String -> Rules a
directory act f = act $ fromGlob $ f ++ "/**"

main :: IO ()
main = 
    let
        myIgnorFile path    = ignoreFile defaultConfiguration path
        conf = defaultConfiguration 
            { ignoreFile = myIgnorFile
            , destinationDirectory  = "docs"
            , previewPort           = 5000
            }
    in
        hakyllWith conf $ do
        match "images/*" $ do
            route   idRoute
            compile copyFileCompiler

        match "files/*" $ do
            route   idRoute
            compile copyFileCompiler

        match "assets/**" $ do
            route   idRoute
            compile copyFileCompiler

        match "stylesheets/*" $ do
            route   stylesheetRoute
            compile sassCompiler


        match "pages/*" $ do
            route $ niceBaseRoute
            compile $ pandocCompiler
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls
                >>= removeIndexHtml

        match "posts/*" $ do
            route $ niceRoute
            compile $ pandocCompiler
                >>= loadAndApplyTemplate "templates/post.html"    postCtx
                >>= saveSnapshot "content"
                >>= loadAndApplyTemplate "templates/default.html" postCtx
                >>= relativizeUrls
                >>= removeIndexHtml

        create ["posts.html"] $ do
            route $ niceRoute
            compile $ do
                posts <- recentFirst =<< loadAll "posts/*"
                let myPostsCtx =
                        listField "posts" postCtx (return posts) `mappend`
                        constField "title" "Posts"              `mappend`
                        defaultContext

                makeItem ""
                    >>= loadAndApplyTemplate "templates/postlist.html" myPostsCtx
                    >>= loadAndApplyTemplate "templates/default.html" myPostsCtx
                    >>= relativizeUrls
                    >>= removeIndexHtml

        create ["archive.html"] $ do
            route $ niceRoute
            compile $ do
                posts <- recentFirst =<< loadAll "posts/*"
                let archiveCtx =
                        listField "posts" postCtx (return posts) `mappend`
                        constField "title" "Archives"            `mappend`
                        defaultContext

                makeItem ""
                    >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                    >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                    >>= relativizeUrls
                    >>= removeIndexHtml

        match "index.html" $ do
            route idRoute
            compile $ do
                posts <- recentFirst =<< loadAll "posts/*"
                let indexCtx =
                        listField "posts" postCtx (return posts) `mappend`
                        defaultContext

                getResourceBody
                    >>= applyAsTemplate indexCtx
                    >>= loadAndApplyTemplate "templates/default.html" indexCtx
                    >>= relativizeUrls
                    >>= removeIndexHtml

        match "templates/*" $ compile templateBodyCompiler

        match "CNAME" $ do
            route   idRoute
            compile copyFileCompiler

        match "robots.txt" $ do
            route idRoute
            compile copyFileCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext
