module Paths_condor_nlp (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/klangner/.cabal/bin"
libdir     = "/home/klangner/.cabal/lib/condor-nlp-0.1/ghc-7.6.3"
datadir    = "/home/klangner/.cabal/share/condor-nlp-0.1"
libexecdir = "/home/klangner/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "condor_nlp_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "condor_nlp_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "condor_nlp_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "condor_nlp_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
